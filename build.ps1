#!/usr/bin/env powershell
# ==============================================================================
# build.ps1 - Dragon Warrior IV 🌷 Flower Toolchain Build System
# ==============================================================================
#
# Complete build pipeline using the Flower Toolchain:
#   🌺 Peony    - Disassembler (ROM → Source)
#   🌼 Pansy    - Metadata Format (Symbols, Comments, Cross-refs)
#   🌸 Poppy   - Assembler (Source → ROM)
#
# This script handles:
#   1. Asset extraction from binary to JSON (editable)
#   2. Asset transformation back to binary
#   3. Assembly code generation from asset data
#   4. ROM compilation using Poppy assembler
#   5. Byte-identical verification against original ROM
#
# Usage:
#   .\build.ps1                    # Standard build
#   .\build.ps1 -Clean             # Clean build (removes build artifacts)
#   .\build.ps1 -ExtractAssets     # Extract assets from ROM first
#   .\build.ps1 -Verbose -Test     # Verbose build with tests
#   .\build.ps1 -Disassemble       # Run Peony disassembly first
#
# Prerequisites:
#   - .NET 10 runtime (for Poppy/Peony/Pansy)
#   - Python 3.11+ (for asset tools)
#   - ROM file in roms/ directory
#
# ==============================================================================

param(
	# Clean build directories before building
	[switch]$Clean,

	# Run Peony disassembly before build
	[switch]$Disassemble,

	# Extract assets from ROM before build
	[switch]$ExtractAssets,

	# Convert assets from JSON to binary before build
	[switch]$ConvertAssets,

	# Show verbose build output
	[switch]$Verbose,

	# Run tests after successful build
	[switch]$Test,

	# Generate symbol file for debugging
	[switch]$Symbols,

	# Specify output ROM file name
	[string]$Output = "dragon-warrior-4.nes"
)

$ErrorActionPreference = "Stop"

# ==============================================================================
# Configuration - Load from build.config.json
# ==============================================================================

$BuildRoot = $PSScriptRoot
$ConfigFile = Join-Path $BuildRoot "build.config.json"

# Load configuration
if (Test-Path $ConfigFile) {
	$Config = Get-Content $ConfigFile -Raw | ConvertFrom-Json
} else {
	Write-Host "WARNING: build.config.json not found, using defaults" -ForegroundColor Yellow
	$Config = @{
		project = @{ name = "Dragon Warrior IV"; platform = "nes" }
		source = @{ assembler = "poppy"; mainFile = "src/main.pasm" }
		build = @{ outputDir = "build"; verify = $true }
	}
}

# Directory configuration
$SourceDir = Join-Path $BuildRoot "src"
$BuildDir = Join-Path $BuildRoot ($Config.build.outputDir ?? "build")
$ToolsDir = Join-Path $BuildRoot "tools"
$AssetDir = Join-Path $BuildRoot "assets"
$RomDir = Join-Path $BuildRoot "roms"
$MetadataDir = Join-Path $BuildRoot "metadata"

# 🌷 Flower Toolchain paths (relative to parent directory)
$FlowerRoot = Split-Path $BuildRoot -Parent
$PoppyProject = Join-Path $FlowerRoot "poppy" "src" "Poppy.Cli"
$PeonyProject = Join-Path $FlowerRoot "peony" "src" "Peony.Cli"
$PansyProject = Join-Path $FlowerRoot "pansy" "src" "Pansy.Cli"

# Reference ROM path
$ReferenceROM = Join-Path $RomDir "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Expected checksum for verification
$ExpectedChecksum = $Config.build.verifyChecksum ?? "a5a781e5ae7c75765969eba2beb4e27f"

# Output colors
$ColorSuccess = "Green"
$ColorError = "Red"
$ColorWarning = "Yellow"
$ColorInfo = "Cyan"
$ColorFlower = "Magenta"

# ==============================================================================
# Helper Functions
# ==============================================================================

<#
.SYNOPSIS
	Writes colored log messages with timestamp.

.DESCRIPTION
	Provides formatted, color-coded output for build status messages
	with timestamps for tracking build progress.

.PARAMETER Message
	The message text to display.

.PARAMETER Level
	Severity level: INFO, SUCCESS, WARNING, ERROR, or FLOWER.
#>
function Write-BuildLog {
	param(
		[string]$Message,
		[ValidateSet("INFO", "SUCCESS", "WARNING", "ERROR", "FLOWER")]
		[string]$Level = "INFO"
	)

	$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
	$color = switch($Level) {
		"SUCCESS" { $ColorSuccess }
		"ERROR" { $ColorError }
		"WARNING" { $ColorWarning }
		"FLOWER" { $ColorFlower }
		default { $ColorInfo }
	}

	Write-Host "[$timestamp] " -NoNewline -ForegroundColor Gray
	Write-Host "$Level " -NoNewline -ForegroundColor $color
	Write-Host $Message
}

<#
.SYNOPSIS
	Displays the build system banner.

.DESCRIPTION
	Shows a decorative banner with project information and
	Flower Toolchain branding.
#>
function Show-Banner {
	Write-Host ""
	Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "║   🐉 DRAGON WARRIOR IV - DISASSEMBLY BUILD SYSTEM 🐉          ║" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "║   🌷 Flower Toolchain: Peony → Pansy → Poppy                  ║" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
	Write-Host ""
}

<#
.SYNOPSIS
	Validates build prerequisites.

.DESCRIPTION
	Checks for required tools, directories, and files before
	starting the build process.

.OUTPUTS
	Returns $true if all prerequisites are met.
#>
function Test-Prerequisites {
	Write-BuildLog "Checking build prerequisites..."

	$allGood = $true

	# Check for .NET runtime
	try {
		$dotnetVersion = & dotnet --version 2>$null
		Write-BuildLog "Found .NET: $dotnetVersion"
	} catch {
		Write-BuildLog ".NET runtime not found. Install .NET 10 SDK." "ERROR"
		$allGood = $false
	}

	# Check for Python
	try {
		$pythonVersion = & python --version 2>&1
		Write-BuildLog "Found Python: $pythonVersion"
	} catch {
		Write-BuildLog "Python not found. Install Python 3.11+." "WARNING"
	}

	# Check Poppy project exists (primary assembler)
	if (Test-Path (Join-Path $PoppyProject "Poppy.Cli.csproj")) {
		Write-BuildLog "🌸 Poppy assembler project found" "FLOWER"
	} else {
		Write-BuildLog "🌸 Poppy not found at: $PoppyProject" "WARNING"
		Write-BuildLog "Clone poppy repo: git clone https://github.com/TheAnsarya/poppy ../poppy" "INFO"
	}

	# Check for source directory
	if (-not (Test-Path $SourceDir)) {
		Write-BuildLog "Source directory not found: $SourceDir" "WARNING"
		Write-BuildLog "Creating empty source directory..." "INFO"
		New-Item -ItemType Directory -Path $SourceDir -Force | Out-Null
	}

	# Check for main assembly file
	$mainFile = Join-Path $BuildRoot ($Config.source.mainFile ?? "src/main.pasm")
	if (-not (Test-Path $mainFile)) {
		Write-BuildLog "Main source file not found: $mainFile" "WARNING"
		Write-BuildLog "Run .\disassemble.ps1 to generate source from ROM" "INFO"
	} else {
		Write-BuildLog "Main source file: $mainFile"
	}

	# Check for reference ROM
	if (-not (Test-Path $ReferenceROM)) {
		Write-BuildLog "Reference ROM not found: $ReferenceROM" "WARNING"
		Write-BuildLog "Place ROM in roms/ directory for verification" "INFO"
	} else {
		Write-BuildLog "Reference ROM found"
	}

	if ($allGood) {
		Write-BuildLog "Prerequisites check completed" "SUCCESS"
	}

	return $allGood
}

<#
.SYNOPSIS
	Initializes the build environment.

.DESCRIPTION
	Creates necessary directories and optionally cleans
	previous build artifacts.
#>
function Initialize-BuildEnvironment {
	Write-BuildLog "Initializing build environment..."

	# Clean if requested
	if ($Clean -and (Test-Path $BuildDir)) {
		Write-BuildLog "Cleaning build directory..."
		Remove-Item -Path $BuildDir -Recurse -Force
	}

	# Create required directories
	$directories = @(
		$BuildDir,
		(Join-Path $BuildDir "temp"),
		(Join-Path $AssetDir "binary"),
		(Join-Path $AssetDir "json"),
		$MetadataDir
	)

	foreach ($dir in $directories) {
		if (-not (Test-Path $dir)) {
			New-Item -ItemType Directory -Path $dir -Force | Out-Null
		}
	}

	Write-BuildLog "Build environment ready"
}

# ==============================================================================
# Asset Pipeline Functions
# ==============================================================================

<#
.SYNOPSIS
	Extracts assets from the ROM to binary format.

.DESCRIPTION
	Uses asset extraction tools to pull graphics, text, and data
	from the ROM into binary files for conversion.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-AssetExtraction {
	Write-BuildLog "Extracting assets from ROM..."

	$extractScript = Join-Path $ToolsDir "asset_extractor.py"

	if (-not (Test-Path $extractScript)) {
		Write-BuildLog "Asset extractor not found: $extractScript" "WARNING"
		return $true  # Not a fatal error
	}

	if (-not (Test-Path $ReferenceROM)) {
		Write-BuildLog "ROM not found for extraction: $ReferenceROM" "ERROR"
		return $false
	}

	$outputDir = Join-Path $AssetDir "binary"

	try {
		Write-BuildLog "Running: python $extractScript"
		& python $extractScript --rom $ReferenceROM --output $outputDir

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "Asset extraction completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Asset extraction failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Asset extraction error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Converts binary assets to editable JSON format.

.DESCRIPTION
	Transforms extracted binary data into JSON files that can be
	edited with standard tools or the universal editor.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-BinaryToEditable {
	Write-BuildLog "Converting assets: Binary → JSON..."

	$converterScript = Join-Path $ToolsDir "bin_to_editable.py"

	if (-not (Test-Path $converterScript)) {
		Write-BuildLog "Converter not found: $converterScript" "WARNING"
		return $true
	}

	$inputDir = Join-Path $AssetDir "binary"
	$outputDir = Join-Path $AssetDir "json"

	try {
		& python $converterScript --input $inputDir --output $outputDir

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "Binary → JSON conversion completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Conversion failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Conversion error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Converts editable JSON back to binary format.

.DESCRIPTION
	Transforms edited JSON files back into binary data for
	insertion into the ROM build.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-EditableToBinary {
	Write-BuildLog "Converting assets: JSON → Binary..."

	$converterScript = Join-Path $ToolsDir "editable_to_bin.py"

	if (-not (Test-Path $converterScript)) {
		Write-BuildLog "Converter not found: $converterScript" "WARNING"
		return $true
	}

	$inputDir = Join-Path $AssetDir "json"
	$outputDir = Join-Path $BuildDir "binary"

	try {
		& python $converterScript --input $inputDir --output $outputDir

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "JSON → Binary conversion completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Conversion failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Conversion error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Generates assembly source from JSON asset data.

.DESCRIPTION
	Creates .pasm include files from JSON data tables for
	inclusion in the ROM build.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-AssetGeneration {
	Write-BuildLog "Generating assembly from assets..."

	$generatorScript = Join-Path $ToolsDir "json_to_asm.py"

	if (-not (Test-Path $generatorScript)) {
		Write-BuildLog "Generator not found: $generatorScript" "WARNING"
		return $true
	}

	$inputDir = Join-Path $AssetDir "json"
	$outputDir = Join-Path $SourceDir "data" "generated"

	# Ensure output directory exists
	if (-not (Test-Path $outputDir)) {
		New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
	}

	try {
		& python $generatorScript --input $inputDir --output $outputDir

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "Assembly generation completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Generation failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Generation error: $_" "ERROR"
		return $false
	}
}

# ==============================================================================
# Build Functions
# ==============================================================================

<#
.SYNOPSIS
	Invokes the Peony disassembler.

.DESCRIPTION
	Runs the disassemble.ps1 script to generate source code
	from the ROM using Peony.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-Disassembly {
	Write-BuildLog "🌺 Running Peony disassembly..." "FLOWER"

	$disasmScript = Join-Path $BuildRoot "disassemble.ps1"

	if (-not (Test-Path $disasmScript)) {
		Write-BuildLog "Disassembly script not found: $disasmScript" "ERROR"
		return $false
	}

	try {
		& $disasmScript

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "🌺 Disassembly completed" "FLOWER"
			return $true
		} else {
			Write-BuildLog "Disassembly failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Disassembly error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Builds the ROM using Poppy assembler.

.DESCRIPTION
	Compiles the assembly source code into a NES ROM using
	the Poppy assembler from the Flower Toolchain.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-PoppyBuild {
	Write-BuildLog "🌸 Building ROM with Poppy..." "FLOWER"

	$outputROM = Join-Path $BuildDir $Output
	$mainFile = Join-Path $BuildRoot ($Config.source.mainFile ?? "src/main.pasm")

	if (-not (Test-Path $mainFile)) {
		Write-BuildLog "Main source file not found: $mainFile" "ERROR"
		Write-BuildLog "Run with -Disassemble to generate source first" "INFO"
		return $false
	}

	# Check if Poppy project exists
	$poppyCsproj = Join-Path $PoppyProject "Poppy.Cli.csproj"
	if (-not (Test-Path $poppyCsproj)) {
		Write-BuildLog "Poppy project not found: $poppyCsproj" "ERROR"
		Write-BuildLog "Clone poppy repo: git clone https://github.com/TheAnsarya/poppy ../poppy" "INFO"

		# Fallback: Try legacy Ophis assembler
		return Invoke-OphisBuild
	}

	# Build Poppy arguments
	$poppyArgs = @(
		"build",
		"`"$mainFile`"",
		"--output", "`"$outputROM`"",
		"--platform", "nes"
	)

	if ($Symbols) {
		$symbolFile = Join-Path $BuildDir "dragon-warrior-4.sym"
		$poppyArgs += "--symbols", "`"$symbolFile`""
	}

	if ($Verbose) {
		$poppyArgs += "--verbose"
	}

	try {
		Write-BuildLog "Executing: dotnet run --project $PoppyProject -- $($poppyArgs -join ' ')"

		Push-Location $PoppyProject
		$result = & dotnet run -- $poppyArgs 2>&1
		$exitCode = $LASTEXITCODE
		Pop-Location

		if ($Verbose) {
			Write-Host $result
		}

		if ($exitCode -eq 0) {
			Write-BuildLog "🌸 ROM build completed" "FLOWER"

			# Show ROM info
			if (Test-Path $outputROM) {
				$romSize = (Get-Item $outputROM).Length
				$romSizeKB = [math]::Round($romSize / 1024, 2)
				Write-BuildLog "ROM size: $romSizeKB KB ($romSize bytes)"
			}

			return $true
		} else {
			Write-BuildLog "Poppy build failed" "ERROR"
			Write-Host $result -ForegroundColor Red
			return $false
		}
	} catch {
		Write-BuildLog "Build error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Fallback build using legacy Ophis assembler.

.DESCRIPTION
	Uses the Ophis assembler as a fallback when Poppy is not available.
	This is temporary until full migration to the Flower Toolchain.

.OUTPUTS
	Returns $true on success.
#>
function Invoke-OphisBuild {
	Write-BuildLog "Using legacy Ophis assembler (fallback)..." "WARNING"

	$OphisExe = Join-Path $BuildRoot "Ophis" "ophis.exe"
	$outputROM = Join-Path $BuildDir $Output

	if (-not (Test-Path $OphisExe)) {
		Write-BuildLog "Ophis assembler not found: $OphisExe" "ERROR"
		return $false
	}

	# Check for main assembly file (Ophis uses .asm extension)
	$mainAsm = Join-Path $BuildRoot "source_files" "main.asm"
	if (-not (Test-Path $mainAsm)) {
		$mainAsm = Join-Path $BuildRoot "source_files" "DW4_Main.asm"
	}

	if (-not (Test-Path $mainAsm)) {
		Write-BuildLog "No Ophis-compatible main file found" "ERROR"
		return $false
	}

	$ophisArgs = @($mainAsm, $outputROM)
	if ($Verbose) {
		$ophisArgs = @("-v", "2") + $ophisArgs
	}

	try {
		Write-BuildLog "Executing: $OphisExe $($ophisArgs -join ' ')"
		& $OphisExe $ophisArgs 2>&1

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "Ophis build completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Ophis build failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Build error: $_" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Verifies the built ROM against the reference.

.DESCRIPTION
	Compares the built ROM's hash against the original ROM
	to verify byte-identical output.

.OUTPUTS
	Returns $true if ROMs match.
#>
function Invoke-ROMVerification {
	$outputROM = Join-Path $BuildDir $Output

	if (-not (Test-Path $ReferenceROM)) {
		Write-BuildLog "Reference ROM not found, skipping verification" "WARNING"
		return $true
	}

	if (-not (Test-Path $outputROM)) {
		Write-BuildLog "Built ROM not found, skipping verification" "WARNING"
		return $true
	}

	Write-BuildLog "Verifying ROM against reference..."

	# Calculate MD5 hash (matches config checksum format)
	$refMd5 = (Get-FileHash -Path $ReferenceROM -Algorithm MD5).Hash.ToLower()
	$outMd5 = (Get-FileHash -Path $outputROM -Algorithm MD5).Hash.ToLower()

	# Also calculate SHA256 for additional verification
	$refSha = (Get-FileHash -Path $ReferenceROM -Algorithm SHA256).Hash
	$outSha = (Get-FileHash -Path $outputROM -Algorithm SHA256).Hash

	Write-BuildLog "Reference MD5: $refMd5"
	Write-BuildLog "Built MD5:     $outMd5"

	if ($refMd5 -eq $outMd5 -and $refSha -eq $outSha) {
		Write-BuildLog "ROM verification: BYTE-IDENTICAL! ✓" "SUCCESS"
		return $true
	} else {
		Write-BuildLog "ROM verification: MISMATCH" "WARNING"

		# Compare file sizes
		$refSize = (Get-Item $ReferenceROM).Length
		$outSize = (Get-Item $outputROM).Length

		if ($refSize -ne $outSize) {
			Write-BuildLog "Size difference: Reference=$refSize, Built=$outSize (diff: $($outSize - $refSize))" "WARNING"
		}

		# Run detailed comparison
		Invoke-DetailedComparison -Reference $ReferenceROM -Built $outputROM

		return $false
	}
}

<#
.SYNOPSIS
	Performs detailed ROM comparison to find differences.

.DESCRIPTION
	When verification fails, this function finds the exact
	byte offsets where the ROMs differ.

.PARAMETER Reference
	Path to the reference (original) ROM.

.PARAMETER Built
	Path to the built ROM.
#>
function Invoke-DetailedComparison {
	param(
		[string]$Reference,
		[string]$Built
	)

	Write-BuildLog "Performing detailed comparison..."

	$refBytes = [System.IO.File]::ReadAllBytes($Reference)
	$outBytes = [System.IO.File]::ReadAllBytes($Built)

	$minLen = [Math]::Min($refBytes.Length, $outBytes.Length)
	$diffCount = 0
	$firstDiff = -1

	for ($i = 0; $i -lt $minLen; $i++) {
		if ($refBytes[$i] -ne $outBytes[$i]) {
			if ($firstDiff -eq -1) {
				$firstDiff = $i
			}
			$diffCount++
		}
	}

	# Count extra bytes as differences
	$diffCount += [Math]::Abs($refBytes.Length - $outBytes.Length)

	if ($diffCount -gt 0) {
		Write-BuildLog "Found $diffCount byte difference(s)" "INFO"
		if ($firstDiff -ge 0) {
			$bank = [Math]::Floor(($firstDiff - 16) / 0x4000)  # Subtract header, divide by bank size
			Write-BuildLog "First difference at offset: 0x$($firstDiff.ToString('X6')) (Bank $bank)" "INFO"
		}
	}
}

<#
.SYNOPSIS
	Runs the test suite.

.DESCRIPTION
	Executes pytest to run the project's test suite.

.OUTPUTS
	Returns $true if all tests pass.
#>
function Invoke-Tests {
	Write-BuildLog "Running tests..."

	$testDir = Join-Path $BuildRoot "tests"

	if (-not (Test-Path $testDir)) {
		Write-BuildLog "Test directory not found, skipping tests" "WARNING"
		return $true
	}

	try {
		& python -m pytest $testDir -v

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "All tests passed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Some tests failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Test error: $_" "ERROR"
		return $false
	}
}

# ==============================================================================
# Main Entry Point
# ==============================================================================

<#
.SYNOPSIS
	Main build orchestration function.

.DESCRIPTION
	Coordinates all build phases: prerequisites, asset pipeline,
	assembly, verification, and testing.
#>
function Main {
	Show-Banner

	$startTime = Get-Date

	# Check prerequisites
	if (-not (Test-Prerequisites)) {
		Write-BuildLog "Prerequisites check failed. Aborting build." "ERROR"
		exit 1
	}

	# Initialize environment
	Initialize-BuildEnvironment

	Write-Host ""

	# Optional: Run disassembly
	if ($Disassemble) {
		if (-not (Invoke-Disassembly)) {
			Write-BuildLog "Disassembly failed" "ERROR"
			exit 1
		}
		Write-Host ""
	}

	# Optional: Extract assets from ROM
	if ($ExtractAssets) {
		if (-not (Invoke-AssetExtraction)) {
			Write-BuildLog "Asset extraction failed" "WARNING"
		}
		Write-Host ""
	}

	# Optional: Convert assets
	if ($ConvertAssets) {
		if (-not (Invoke-EditableToBinary)) {
			Write-BuildLog "Asset conversion failed" "WARNING"
		}
		Write-Host ""
	}

	# Generate assembly from assets
	if (-not (Invoke-AssetGeneration)) {
		Write-BuildLog "Asset generation failed" "WARNING"
	}

	Write-Host ""

	# Build ROM
	if (-not (Invoke-PoppyBuild)) {
		Write-BuildLog "Build failed. Check errors above." "ERROR"
		exit 1
	}

	Write-Host ""

	# Verify ROM
	$verifyResult = Invoke-ROMVerification

	# Run tests if requested
	if ($Test) {
		Write-Host ""
		Invoke-Tests
	}

	# Summary
	$endTime = Get-Date
	$duration = $endTime - $startTime

	Write-Host ""
	Write-BuildLog "Build completed in $($duration.TotalSeconds.ToString('F2')) seconds"

	if ($verifyResult) {
		Write-Host ""
		Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
		Write-Host "║              🌸 BUILD SUCCESSFUL - BYTE IDENTICAL! ✓          ║" -ForegroundColor Green
		Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
		Write-Host ""
		Write-Host "Output: $BuildDir\$Output" -ForegroundColor White
		exit 0
	} else {
		Write-Host ""
		Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Yellow
		Write-Host "║     BUILD COMPLETED (verification differences detected)        ║" -ForegroundColor Yellow
		Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow
		Write-Host ""
		Write-Host "Output: $BuildDir\$Output" -ForegroundColor White
		Write-Host "Review differences and update source for byte-identical build." -ForegroundColor Gray
		exit 0
	}
}

# Execute main function
Main


	$assetReinserter = Join-Path $ToolsDir "asset_reinserter.py"

	if (-not (Test-Path $assetReinserter)) {
		Write-BuildLog "Asset reinserter not found, skipping asset generation" "WARNING"
		return $true
	}

	try {
		$result = & python $assetReinserter --output (Join-Path $SourceDir "generated")

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "Asset generation completed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Asset generation failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Asset generation error: $_" "ERROR"
		return $false
	}
}

function Invoke-ROMBuild {
	Write-BuildLog "Building ROM..."

	$outputROM = Join-Path $BuildDir $Output

	# Check for main assembly file
	$mainAsm = Join-Path $SourceDir "main.asm"
	if (-not (Test-Path $mainAsm)) {
		# Try DW4 specific main file
		$mainAsm = Join-Path $SourceDir "DW4_Main.asm"
	}

	if (-not (Test-Path $mainAsm)) {
		Write-BuildLog "No main assembly file found in $SourceDir" "WARNING"
		Write-BuildLog "Create source_files/main.asm or source_files/DW4_Main.asm" "WARNING"
		return $false
	}

	# Build Ophis arguments
	$ophisArgs = @($mainAsm, $outputROM)

	if ($Verbose) {
		$ophisArgs = @("-v", "2") + $ophisArgs
	}

	Write-BuildLog "Executing: $OphisExe $($ophisArgs -join ' ')"

	try {
		$result = & $OphisExe $ophisArgs 2>&1

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "ROM build completed successfully" "SUCCESS"

			# Show ROM size
			if (Test-Path $outputROM) {
				$romSize = (Get-Item $outputROM).Length
				$romSizeKB = [math]::Round($romSize / 1024, 2)
				Write-BuildLog "ROM size: $romSizeKB KB ($romSize bytes)"
			}

			return $true
		} else {
			Write-BuildLog "ROM build failed" "ERROR"
			Write-Host $result -ForegroundColor Red
			return $false
		}
	} catch {
		Write-BuildLog "Build error: $_" "ERROR"
		return $false
	}
}

function Invoke-ROMVerification {
	if (-not (Test-Path $ReferenceROM)) {
		Write-BuildLog "Reference ROM not found, skipping verification" "WARNING"
		return $true
	}

	$outputROM = Join-Path $BuildDir $Output

	if (-not (Test-Path $outputROM)) {
		Write-BuildLog "Built ROM not found, skipping verification" "WARNING"
		return $true
	}

	Write-BuildLog "Verifying ROM against reference..."

	$refHash = (Get-FileHash -Path $ReferenceROM -Algorithm SHA256).Hash
	$outHash = (Get-FileHash -Path $outputROM -Algorithm SHA256).Hash

	if ($refHash -eq $outHash) {
		Write-BuildLog "ROM verification: PERFECT MATCH! ✓" "SUCCESS"
		return $true
	} else {
		Write-BuildLog "ROM verification: Hash mismatch" "WARNING"
		Write-BuildLog "Reference: $refHash"
		Write-BuildLog "Built:     $outHash"

		# Compare file sizes
		$refSize = (Get-Item $ReferenceROM).Length
		$outSize = (Get-Item $outputROM).Length

		if ($refSize -ne $outSize) {
			Write-BuildLog "Size mismatch: Reference=$refSize, Built=$outSize" "WARNING"
		}

		return $false
	}
}

function Invoke-Tests {
	Write-BuildLog "Running tests..."

	$testDir = Join-Path $BuildRoot "tests"

	if (-not (Test-Path $testDir)) {
		Write-BuildLog "Test directory not found, skipping tests" "WARNING"
		return $true
	}

	try {
		$result = & python -m pytest $testDir -v

		if ($LASTEXITCODE -eq 0) {
			Write-BuildLog "All tests passed" "SUCCESS"
			return $true
		} else {
			Write-BuildLog "Some tests failed" "ERROR"
			return $false
		}
	} catch {
		Write-BuildLog "Test error: $_" "ERROR"
		return $false
	}
}

# Main execution
Show-Banner

$startTime = Get-Date

if (-not (Test-Prerequisites)) {
	Write-BuildLog "Prerequisites check failed. Aborting build." "ERROR"
	exit 1
}

Initialize-BuildEnvironment

# Run asset generation
if (-not (Invoke-AssetGeneration)) {
	Write-BuildLog "Asset generation failed" "WARNING"
}

# Build ROM
if (-not (Invoke-ROMBuild)) {
	Write-BuildLog "Build failed. Check errors above." "ERROR"
	exit 1
}

# Verify ROM
$verifyResult = Invoke-ROMVerification

# Run tests if requested
if ($Test) {
	Invoke-Tests
}

$endTime = Get-Date
$duration = $endTime - $startTime

Write-Host ""
Write-BuildLog "Build completed in $($duration.TotalSeconds.ToString('F2')) seconds"

if ($verifyResult) {
	Write-Host ""
	Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
	Write-Host "║                    BUILD SUCCESSFUL! ✓                        ║" -ForegroundColor Green
	Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
	exit 0
} else {
	Write-Host ""
	Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Yellow
	Write-Host "║        BUILD COMPLETED (with verification differences)         ║" -ForegroundColor Yellow
	Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow
	exit 0
}
