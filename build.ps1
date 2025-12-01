#!/usr/bin/env powershell
<#
.SYNOPSIS
Dragon Warrior 4 Info Project - Main Build Script

.DESCRIPTION
Comprehensive build system for Dragon Warrior 4 ROM assembly, asset processing, and testing.

.PARAMETER Clean
Clean build directories before building

.PARAMETER Verbose
Show verbose build output

.PARAMETER Test
Run tests after successful build

.PARAMETER Symbols
Generate symbol file for debugging

.PARAMETER Output
Specify output ROM file name

.EXAMPLE
.\build.ps1
Basic build

.EXAMPLE
.\build.ps1 -Clean -Verbose -Test
Clean build with verbose output and testing

.EXAMPLE
.\build.ps1 -Output "dw4_modified.nes" -Symbols
Build with custom output name and debug symbols
#>

param(
	[switch]$Clean,
	[switch]$Verbose,
	[switch]$Test,
	[switch]$Symbols,
	[string]$Output = "dragon_warrior_4_rebuilt.nes"
)

$ErrorActionPreference = "Stop"

# Build configuration
$BuildRoot = $PSScriptRoot
$SourceDir = Join-Path $BuildRoot "source_files"
$BuildDir = Join-Path $BuildRoot "build"
$ToolsDir = Join-Path $BuildRoot "tools"
$AssetDir = Join-Path $BuildRoot "assets"
$ROMDir = Join-Path $BuildRoot "roms"
$OphisExe = Join-Path $BuildRoot "Ophis" "ophis.exe"

# Reference ROM path
$ReferenceROM = Join-Path $ROMDir "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# Colors for output
$ColorSuccess = "Green"
$ColorError = "Red"
$ColorWarning = "Yellow"
$ColorInfo = "Cyan"

function Write-BuildLog {
	param(
		[string]$Message,
		[string]$Level = "INFO"
	)

	$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
	$color = switch($Level) {
		"SUCCESS" { $ColorSuccess }
		"ERROR" { $ColorError }
		"WARNING" { $ColorWarning }
		default { $ColorInfo }
	}

	Write-Host "[$timestamp] " -NoNewline -ForegroundColor Gray
	Write-Host "$Level " -NoNewline -ForegroundColor $color
	Write-Host $Message
}

function Show-Banner {
	Write-Host ""
	Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
	Write-Host "║                                                               ║" -ForegroundColor Cyan
	Write-Host "║     🐉 DRAGON WARRIOR 4 - DISASSEMBLY BUILD SYSTEM 🐉        ║" -ForegroundColor Cyan
	Write-Host "║                                                               ║" -ForegroundColor Cyan
	Write-Host "║     Complete ROM Assembly with Asset Pipeline                 ║" -ForegroundColor Cyan
	Write-Host "║                                                               ║" -ForegroundColor Cyan
	Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
	Write-Host ""
}

function Test-Prerequisites {
	Write-BuildLog "Checking build prerequisites..."

	# Check for Ophis assembler
	if (-not (Test-Path $OphisExe)) {
		Write-BuildLog "Ophis assembler not found at $OphisExe" "ERROR"
		Write-BuildLog "Please ensure Ophis is installed in the Ophis/ directory" "ERROR"
		return $false
	}

	# Check for Python
	try {
		$pythonVersion = & python --version 2>&1
		Write-BuildLog "Found Python: $pythonVersion"
	} catch {
		Write-BuildLog "Python not found. Please install Python 3.8+" "ERROR"
		return $false
	}

	# Check for source files directory
	if (-not (Test-Path $SourceDir)) {
		Write-BuildLog "Source directory not found: $SourceDir" "WARNING"
		Write-BuildLog "Creating empty source directory structure..."
		New-Item -ItemType Directory -Path $SourceDir -Force | Out-Null
	}

	# Check for reference ROM
	if (-not (Test-Path $ReferenceROM)) {
		Write-BuildLog "Reference ROM not found: $ReferenceROM" "WARNING"
		Write-BuildLog "Place your ROM in the roms/ directory for comparison" "WARNING"
	}

	Write-BuildLog "Prerequisites check completed" "SUCCESS"
	return $true
}

function Initialize-BuildEnvironment {
	Write-BuildLog "Initializing build environment..."

	# Clean if requested
	if ($Clean -and (Test-Path $BuildDir)) {
		Write-BuildLog "Cleaning build directory..."
		Remove-Item -Path $BuildDir -Recurse -Force
	}

	# Create build directory
	if (-not (Test-Path $BuildDir)) {
		New-Item -ItemType Directory -Path $BuildDir -Force | Out-Null
	}

	Write-BuildLog "Build environment ready"
}

function Invoke-AssetGeneration {
	Write-BuildLog "Generating assembly from assets..."

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
