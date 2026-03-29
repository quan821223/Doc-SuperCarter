param(
    [string]$OutputFile = "changelog-standalone.html"
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

    & $python .\tools\inline_print_page.py --input .\site\CHANGELOG\CHANGELOG\index.html --output $OutputFile
    if ($LASTEXITCODE -ne 0) {
        throw "Standalone CHANGELOG export failed."
    }

    Write-Host "Standalone CHANGELOG exported to $outputPath"
}
finally {
    Pop-Location
}
