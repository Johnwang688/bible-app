# Start backend and frontend concurrently (Windows PowerShell).
# Use this when `bash start.sh` fails (e.g. WSL bash missing).

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
Set-Location $root

$backend = $null
$frontend = $null

function Stop-Servers {
    foreach ($p in @($backend, $frontend)) {
        if ($null -ne $p -and -not $p.HasExited) {
            Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue
        }
    }
}

try {
    Write-Host "Starting backend (port 8000)..."
    $backend = Start-Process -FilePath "python" -ArgumentList @(
        "-m", "uvicorn", "app.main:app", "--reload"
    ) -WorkingDirectory $root -PassThru -NoNewWindow

    Write-Host "Starting frontend (port 3000)..."
    $frontend = Start-Process -FilePath "npm" -ArgumentList @("run", "dev") `
        -WorkingDirectory (Join-Path $root "frontend-next") -PassThru -NoNewWindow

    Write-Host ""
    Write-Host "Backend PID: $($backend.Id)"
    Write-Host "Frontend PID: $($frontend.Id)"
    Write-Host "Press Ctrl+C to stop both."
    Write-Host ""

    Wait-Process -Id @($backend.Id, $frontend.Id)
}
finally {
    Write-Host ""
    Write-Host "Shutting down..."
    Stop-Servers
}
