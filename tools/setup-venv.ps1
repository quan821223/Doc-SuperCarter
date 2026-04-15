param(
    [switch]$Recreate,
    [switch]$SkipInstall
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$venvPath = Join-Path $repoRoot "scdoc"
$venvPython = Join-Path $venvPath "Scripts\python.exe"
$venvActivate = Join-Path $venvPath "Scripts\Activate.ps1"
$requirementsFile = Join-Path $repoRoot "requirements.txt"
$activeVenv = $env:VIRTUAL_ENV

function Test-VenvReady {
    param(
        [string]$PythonPath,
        [string]$ActivatePath
    )

    return (Test-Path $PythonPath) -and (Test-Path $ActivatePath)
}

function Enter-VenvShell {
    param(
        [string]$ActivatePath,
        [string]$WorkingDirectory
    )

    $activatePathQuoted = $ActivatePath.Replace("'", "''")
    $workingDirectoryQuoted = $WorkingDirectory.Replace("'", "''")
    $command = "& '$activatePathQuoted'; Set-Location '$workingDirectoryQuoted'"

    Start-Process powershell.exe -ArgumentList @(
        "-NoExit",
        "-ExecutionPolicy", "Bypass",
        "-Command", $command
    ) -WorkingDirectory $WorkingDirectory
}

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

    $venvReady = Test-VenvReady -PythonPath $venvPython -ActivatePath $venvActivate

    if (-not $venvReady) {
        Write-Host "Virtual environment not found. Creating: $venvPath"
        & python -m venv $venvPath
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to create virtual environment at $venvPath"
        }

        $venvReady = Test-VenvReady -PythonPath $venvPython -ActivatePath $venvActivate
        if (-not $venvReady) {
            throw "Virtual environment creation did not produce the expected files in $venvPath"
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
    }
    else {
        Write-Host "Virtual environment already exists. Skipping build: $venvPath"
    }

    Write-Host "Opening a PowerShell session with the virtual environment activated..."
    Enter-VenvShell -ActivatePath $venvActivate -WorkingDirectory $repoRoot
}
finally {
    Pop-Location
}
