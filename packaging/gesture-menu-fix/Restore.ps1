$ErrorActionPreference = "Stop"
try {
    $root = (Read-Host "Full path to the BBPort installation folder").Trim().Trim('"')
    $root = [IO.Path]::GetFullPath($root)
    $base = Join-Path $root "Backups\BBPort-Gesture-Menu-Fix"
    if (!(Test-Path -LiteralPath $base)) { throw "No Gesture Menu Fix backups found." }

    $backups = @(Get-ChildItem -LiteralPath $base -Directory | Sort-Object Name -Descending)
    if (!$backups.Count) { throw "No backups found." }

    for ($i = 0; $i -lt $backups.Count; $i++) {
        Write-Host "$($i+1). $($backups[$i].Name)"
    }
    $pick = Read-Host "Backup number to restore (1 is newest)"
    $index = [int]$pick - 1
    if ($index -lt 0 -or $index -ge $backups.Count) { throw "Invalid backup selection." }

    $backup = $backups[$index].FullName
    $manifestPath = Join-Path $backup "manifest.json"
    if (!(Test-Path -LiteralPath $manifestPath)) { throw "Backup manifest missing." }
    $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json

    if ($manifest.InstallRoot.TrimEnd('\') -ne $root.TrimEnd('\')) {
        throw "This backup belongs to a different installation folder."
    }

    foreach ($entry in $manifest.Files) {
        $dest = Join-Path $root $entry.Path
        $saved = Join-Path $backup $entry.Path
        if ($entry.Existed) {
            if (!(Test-Path -LiteralPath $saved)) { throw "Backup file missing: $saved" }
            New-Item -ItemType Directory -Path (Split-Path $dest -Parent) -Force | Out-Null
            Copy-Item -LiteralPath $saved -Destination $dest -Force
        } elseif (Test-Path -LiteralPath $dest) {
            Remove-Item -LiteralPath $dest -Force
        }
    }

    $ini = Join-Path $root "input.ini"
    if ($manifest.InputIniExisted) {
        $savedIni = Join-Path $backup "input.ini"
        if (!(Test-Path -LiteralPath $savedIni)) { throw "Original input.ini backup missing." }
        Copy-Item -LiteralPath $savedIni -Destination $ini -Force
    } elseif (Test-Path -LiteralPath $ini) {
        Remove-Item -LiteralPath $ini -Force
    }

    Write-Host "Restoration complete. Backup retained at: $backup"
} catch {
    Write-Host "RESTORE FAILED: $_" -ForegroundColor Red
    exit 1
}
