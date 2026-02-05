#!/usr/bin/env powershell
# ==============================================================================
# disassemble.ps1 - Dragon Warrior IV Disassembly Script
# ==============================================================================
#
# Uses 🌺 Peony to disassemble the Dragon Warrior IV ROM into Poppy-compatible
# assembly source code with full symbol/comment support from MLB and CDL files.
#
# This script is part of the 🌷 Flower Toolchain:
#   🌺 Peony    - Disassembler (ROM → Source)
#   🌼 Pansy    - Metadata Format (Symbols, Comments, Cross-refs)
#   🌸 Poppy   - Assembler (Source → ROM)
#
# Usage:
#   .\disassemble.ps1                    # Standard disassembly
#   .\disassemble.ps1 -Full              # Full disassembly with all options
#   .\disassemble.ps1 -BankOnly 8        # Disassemble specific bank only
#   .\disassemble.ps1 -ExportPansy       # Export metadata to Pansy format
#
# Prerequisites:
#   - .NET 10 runtime
#   - Peony CLI built (dotnet build ../peony)
#   - ROM file in roms/ directory
#   - MLB file in debug/ directory (optional but recommended)
#   - CDL file in debug/ directory (optional but recommended)
#
# ==============================================================================

param(
	# Full disassembly with all options enabled
	[switch]$Full,

	# Disassemble only a specific bank (0-31)
	[int]$BankOnly = -1,

	# Export metadata to Pansy format
	[switch]$ExportPansy,

	# Force overwrite existing files
	[switch]$Force,

	# Verbose output
	[switch]$Verbose
)

$ErrorActionPreference = "Stop"

# ==============================================================================
# Configuration
# ==============================================================================

# Project root directory
$ProjectRoot = $PSScriptRoot

# Peony CLI location (relative to this project)
$PeonyCli = Join-Path (Split-Path $ProjectRoot -Parent) "peony" "src" "Peony.Cli" "bin" "Release" "net10.0" "peony"

# Alternative: Use dotnet run if not built
$PeonyProject = Join-Path (Split-Path $ProjectRoot -Parent) "peony" "src" "Peony.Cli"

# ROM file location
$RomFile = Join-Path $ProjectRoot "roms" "Dragon Warrior IV (1992-10)(Enix)(US).nes"

# MLB symbol file (Mesen label format)
$MlbFile = Join-Path $ProjectRoot "debug" "Dragon Warrior IV.mlb"

# CDL file (Code/Data Log from Mesen)
$CdlFile = Join-Path $ProjectRoot "debug" "Dragon Warrior IV.cdl"

# Output directory for disassembled source
$OutputDir = Join-Path $ProjectRoot "src"

# Pansy metadata output file
$PansyFile = Join-Path $ProjectRoot "metadata" "dragon-warrior-4.pansy"

# ==============================================================================
# Helper Functions
# ==============================================================================

<#
.SYNOPSIS
	Writes colored output with timestamp for build logging.

.DESCRIPTION
	Formats log messages with timestamps and color-coded severity levels
	to provide clear feedback during the disassembly process.

.PARAMETER Message
	The message to display.

.PARAMETER Level
	The severity level: INFO, SUCCESS, WARNING, or ERROR.
#>
function Write-Log {
	param(
		[string]$Message,
		[ValidateSet("INFO", "SUCCESS", "WARNING", "ERROR")]
		[string]$Level = "INFO"
	)

	$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
	$color = switch($Level) {
		"SUCCESS" { "Green" }
		"ERROR" { "Red" }
		"WARNING" { "Yellow" }
		default { "Cyan" }
	}

	Write-Host "[$timestamp] " -NoNewline -ForegroundColor Gray
	Write-Host "$Level " -NoNewline -ForegroundColor $color
	Write-Host $Message
}

<#
.SYNOPSIS
	Displays the script banner with project information.

.DESCRIPTION
	Shows a decorative banner with the project name and toolchain info
	at the start of execution for visual feedback.
#>
function Show-Banner {
	Write-Host ""
	Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "║   🌺 PEONY DISASSEMBLER - DRAGON WARRIOR IV                   ║" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "║   🌷 Flower Toolchain: Peony → Pansy → Poppy                  ║" -ForegroundColor Magenta
	Write-Host "║                                                               ║" -ForegroundColor Magenta
	Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
	Write-Host ""
}

<#
.SYNOPSIS
	Checks that all required files exist before disassembly.

.DESCRIPTION
	Validates that the ROM file exists and optionally checks for
	symbol/CDL files to provide better disassembly output.

.OUTPUTS
	Returns $true if prerequisites are met, $false otherwise.
#>
function Test-Prerequisites {
	Write-Log "Checking prerequisites..."

	# Check ROM file exists
	if (-not (Test-Path $RomFile)) {
		Write-Log "ROM file not found: $RomFile" "ERROR"
		Write-Log "Please place the ROM in the roms/ directory" "ERROR"
		return $false
	}
	Write-Log "ROM file found: $RomFile"

	# Check Peony CLI availability
	$peonyAvailable = $false
	if (Test-Path $PeonyCli) {
		Write-Log "Peony CLI found (compiled): $PeonyCli"
		$peonyAvailable = $true
	} elseif (Test-Path (Join-Path $PeonyProject "Peony.Cli.csproj")) {
		Write-Log "Peony CLI project found: $PeonyProject"
		Write-Log "Will use 'dotnet run' to invoke Peony"
		$peonyAvailable = $true
	}

	if (-not $peonyAvailable) {
		Write-Log "Peony CLI not found. Please build the Peony project:" "ERROR"
		Write-Log "  cd ../peony && dotnet build -c Release" "ERROR"
		return $false
	}

	# Check optional MLB file
	if (Test-Path $MlbFile) {
		Write-Log "MLB symbols found: $MlbFile"
	} else {
		Write-Log "MLB symbols not found (disassembly will have fewer labels)" "WARNING"
	}

	# Check optional CDL file
	if (Test-Path $CdlFile) {
		Write-Log "CDL file found: $CdlFile"
	} else {
		Write-Log "CDL file not found (code/data hints unavailable)" "WARNING"
	}

	# Ensure output directory exists
	if (-not (Test-Path $OutputDir)) {
		Write-Log "Creating output directory: $OutputDir"
		New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
	}

	# Ensure metadata directory exists for Pansy export
	$metadataDir = Split-Path $PansyFile -Parent
	if (-not (Test-Path $metadataDir)) {
		Write-Log "Creating metadata directory: $metadataDir"
		New-Item -ItemType Directory -Path $metadataDir -Force | Out-Null
	}

	Write-Log "Prerequisites check completed" "SUCCESS"
	return $true
}

<#
.SYNOPSIS
	Invokes the Peony disassembler with the specified arguments.

.DESCRIPTION
	Runs Peony either as a compiled executable or via 'dotnet run',
	passing all necessary arguments for NES ROM disassembly.

.PARAMETER Arguments
	Array of command-line arguments to pass to Peony.

.OUTPUTS
	Returns the exit code from Peony.
#>
function Invoke-Peony {
	param(
		[string[]]$Arguments
	)

	if (Test-Path $PeonyCli) {
		# Use compiled executable
		$process = Start-Process -FilePath $PeonyCli -ArgumentList $Arguments -NoNewWindow -Wait -PassThru
		return $process.ExitCode
	} else {
		# Use dotnet run
		$argString = $Arguments -join " "
		Push-Location $PeonyProject
		try {
			$process = Start-Process -FilePath "dotnet" -ArgumentList "run", "--", $argString -NoNewWindow -Wait -PassThru
			return $process.ExitCode
		} finally {
			Pop-Location
		}
	}
}

# ==============================================================================
# Main Disassembly Function
# ==============================================================================

<#
.SYNOPSIS
	Performs the main disassembly of the Dragon Warrior IV ROM.

.DESCRIPTION
	Invokes Peony to disassemble the ROM into Poppy-compatible assembly
	source code, using any available symbol and CDL files for better
	label and comment generation.

.OUTPUTS
	Returns $true on success, $false on failure.
#>
function Start-Disassembly {
	Write-Log "Starting disassembly..."

	# Build Peony arguments
	$arguments = @(
		"disasm",
		"`"$RomFile`"",
		"--platform", "nes",
		"--format", "poppy",
		"--output", "`"$OutputDir`"",
		"--all-banks"
	)

	# Add symbol file if available
	if (Test-Path $MlbFile) {
		$arguments += "--symbols", "`"$MlbFile`""
	}

	# Add CDL file if available
	if (Test-Path $CdlFile) {
		$arguments += "--cdl", "`"$CdlFile`""
	}

	# Show command being executed
	if ($Verbose) {
		Write-Log "Command: peony $($arguments -join ' ')"
	}

	Write-Log "Invoking Peony disassembler..."

	# Execute Peony
	$exitCode = Invoke-Peony -Arguments $arguments

	if ($exitCode -eq 0) {
		Write-Log "Disassembly completed successfully" "SUCCESS"
		return $true
	} else {
		Write-Log "Disassembly failed with exit code: $exitCode" "ERROR"
		return $false
	}
}

<#
.SYNOPSIS
	Exports metadata to Pansy format for cross-tool sharing.

.DESCRIPTION
	Converts the MLB symbol file and any CDL data to the universal
	🌼 Pansy metadata format for use with other tools in the ecosystem.
#>
function Export-ToPansy {
	Write-Log "Exporting metadata to Pansy format..."

	# Pansy CLI location
	$PansyCli = Join-Path (Split-Path $ProjectRoot -Parent) "pansy" "src" "Pansy.Cli" "bin" "Release" "net10.0" "pansy"
	$PansyProject = Join-Path (Split-Path $ProjectRoot -Parent) "pansy" "src" "Pansy.Cli"

	# For now, we'll document what needs to happen here
	# TODO: Implement MLB → Pansy conversion in Pansy CLI

	Write-Log "Pansy export not yet implemented - MLB file preserved at: $MlbFile" "WARNING"
	Write-Log "Future: pansy import --mlb `"$MlbFile`" --output `"$PansyFile`"" "INFO"

	return $true
}

# ==============================================================================
# Main Entry Point
# ==============================================================================

<#
.SYNOPSIS
	Main entry point for the disassembly script.

.DESCRIPTION
	Orchestrates the complete disassembly process including prerequisite
	checks, Peony invocation, and optional Pansy export.
#>
function Main {
	Show-Banner

	# Check prerequisites
	if (-not (Test-Prerequisites)) {
		Write-Log "Prerequisite check failed. Aborting." "ERROR"
		exit 1
	}

	Write-Host ""

	# Perform disassembly
	if (-not (Start-Disassembly)) {
		Write-Log "Disassembly failed. See errors above." "ERROR"
		exit 1
	}

	# Export to Pansy if requested
	if ($ExportPansy) {
		Write-Host ""
		if (-not (Export-ToPansy)) {
			Write-Log "Pansy export failed" "WARNING"
		}
	}

	Write-Host ""
	Write-Log "Disassembly pipeline complete!" "SUCCESS"
	Write-Host ""
	Write-Host "Output files:" -ForegroundColor Cyan
	Write-Host "  Source code: $OutputDir" -ForegroundColor White
	Write-Host "  Main file:   $OutputDir\main.pasm" -ForegroundColor White
	Write-Host ""
	Write-Host "Next steps:" -ForegroundColor Cyan
	Write-Host "  1. Review generated source in $OutputDir" -ForegroundColor White
	Write-Host "  2. Run .\build.ps1 to compile with Poppy" -ForegroundColor White
	Write-Host "  3. Verify byte-identical ROM output" -ForegroundColor White
	Write-Host ""
}

# Execute main function
Main
