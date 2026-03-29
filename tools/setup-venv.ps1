param(
    [switch]$Recreate,
    [switch]$SkipInstall
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$venvPath = Join-Path $repoRoot "scdoc"
$venvPython = Join-Path $venvPath "Scripts\python.exe"
$requirementsFile = Join-Path $repoRoot "requirements.txt"

Push-Location $repoRoot
try {
    if ($Recreate -and (Test-Path $venvPath)) {
        Remove-Item -Recurse -Force $venvPath
    }

    if (-not (Test-Path $venvPython)) {
        & python -m venv $venvPath
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to create virtual environment at $venvPath"
        }
    }

    if ((-not $SkipInstall) -and (Test-Path $requirementsFile)) {
        & $venvPython -m pip install -r $requirementsFile
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to install dependencies from $requirementsFile"
        }
    }

    Write-Host "Virtual environment is ready: $venvPath"
    Write-Host "Activate with: .\scdoc\Scripts\Activate.ps1"
    Write-Host "Run MkDocs with: .\scdoc\Scripts\python.exe -m mkdocs serve"
}
finally {
    Pop-Location
}
