param(
    [string]$OutputFile = "offline-manual.html"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$python = Join-Path $repoRoot "scdoc\Scripts\python.exe"
$outputPath = Join-Path $repoRoot $OutputFile

if (-not (Test-Path $python)) {
    throw "Python virtual environment not found: $python"
}

Push-Location $repoRoot
try {
    & $python -m mkdocs build
    if ($LASTEXITCODE -ne 0) {
        throw "mkdocs build failed."
    }

    & $python .\tools\inline_print_page.py --output $OutputFile
    if ($LASTEXITCODE -ne 0) {
        throw "Standalone export failed."
    }

    Write-Host "Standalone HTML exported to $outputPath"
}
finally {
    Pop-Location
}
