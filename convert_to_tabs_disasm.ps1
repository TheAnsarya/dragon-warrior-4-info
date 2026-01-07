# Convert spaces to tabs in assembly files (4 spaces = 1 tab)
param(
    [string]$Path = "disasm"
)

$files = Get-ChildItem -Path $Path -Filter "*.asm" -Recurse

foreach ($file in $files) {
    Write-Host "Processing: $($file.FullName)"
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # Replace 8 spaces with 2 tabs first
    $content = $content.Replace("        ", "`t`t")
    # Then replace remaining 4 spaces with 1 tab  
    $content = $content.Replace("    ", "`t")
    
    [System.IO.File]::WriteAllText($file.FullName, $content)
    Write-Host "  Done: $($file.Name)"
}

Write-Host "`nConversion complete!"
