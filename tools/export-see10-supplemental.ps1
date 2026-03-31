param(
    [string]$OutputFile = "see10-supplemental-notes.html"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$python = Join-Path $repoRoot "scdoc\Scripts\python.exe"
$outputPath = Join-Path $repoRoot $OutputFile
$inputPath = '.\site\see10-supplemental-notes\index.html'

if (-not (Test-Path $python)) {
    throw "Python virtual environment not found: $python"
}

Push-Location $repoRoot
try {
    & $python -m mkdocs build
    if ($LASTEXITCODE -ne 0) {
        throw "mkdocs build failed."
    }

    & $python .\tools\inline_print_page.py --input $inputPath --output $OutputFile
    if ($LASTEXITCODE -ne 0) {
        throw "SEE10 supplemental standalone export failed."
    }

    Write-Host "SEE10 supplemental standalone HTML exported to $outputPath"
}
finally {
    Pop-Location
}
