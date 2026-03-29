param(
    [switch]$Recreate,
    [switch]$SkipInstall
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$venvPath = Join-Path $repoRoot "scdoc"
$venvPython = Join-Path $venvPath "Scripts\python.exe"
$requirementsFile = Join-Path $repoRoot "requirements.txt"
$activeVenv = $env:VIRTUAL_ENV

if ($activeVenv) {
    try {
        $activeVenvResolved = [System.IO.Path]::GetFullPath($activeVenv)
        $targetVenvResolved = [System.IO.Path]::GetFullPath($venvPath)
        if ($activeVenvResolved -eq $targetVenvResolved) {
            throw "The target virtual environment is currently active. Run 'deactivate' first, then rerun this script."
        }
    }
    catch {
        throw
    }
}

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
        & $venvPython -m ensurepip --upgrade
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to bootstrap pip in $venvPath"
        }

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
