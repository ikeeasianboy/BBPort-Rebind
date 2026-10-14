$ErrorActionPreference = "Stop"
$pkg = Split-Path -Parent $MyInvocation.MyCommand.Path
$runtime = Join-Path $pkg "runtime\bin"
$expected = "1706010fa1addfe0c5132296d91f2838a0a339ebdc6de7aa9a293fdac125904b"

try {
    if (!(Test-Path (Join-Path $runtime "bb-probe.exe"))) {
        throw "Package runtime is missing."
    }

    $root = (Read-Host "Full path to Supermedo BBPort v1.7.2 folder").Trim().Trim('"')
    $root = [IO.Path]::GetFullPath($root)

    foreach ($rel in @("Bloodborne.exe", "Play Bloodborne.exe",
                       "bin\bb-probe.exe", "bin\bbbridge-cli.exe")) {
        if (!(Test-Path -LiteralPath (Join-Path $root $rel))) {
            throw "Required v1.7.2 file missing: $rel"
        }
    }

    $hash = (Get-FileHash -Algorithm SHA256 `
        -LiteralPath (Join-Path $root "bin\bb-probe.exe")).Hash.ToLower()
    if ($hash -ne $expected) {
        throw "Runtime hash does not match the expected original v1.7.2 build. Nothing was changed."
    }

    $files = @(Get-ChildItem -LiteralPath $runtime -File -Recurse)
    $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backup = Join-Path $root "Backups\BBPort-Gesture-Menu-Fix\$stamp"
    New-Item -ItemType Directory -Path $backup -Force | Out-Null

    $entries = @()
    foreach ($f in $files) {
        $rel = $f.FullName.Substring($runtime.Length).TrimStart([char[]]@('\','/'))
        $dest = Join-Path (Join-Path $root "bin") $rel
        $exists = Test-Path -LiteralPath $dest
        if ($exists) {
            $saved = Join-Path $backup ("bin\" + $rel)
            New-Item -ItemType Directory -Path (Split-Path $saved -Parent) -Force | Out-Null
            Copy-Item -LiteralPath $dest -Destination $saved -Force
        }
        $entries += [pscustomobject]@{ Path = "bin\$rel"; Existed = $exists }
    }

    $ini = Join-Path $root "input.ini"
    $iniExisted = Test-Path -LiteralPath $ini
    if ($iniExisted) {
        Copy-Item -LiteralPath $ini -Destination (Join-Path $backup "input.ini") -Force
    }

    $manifest = [pscustomobject]@{
        Product = "BBPort Gesture Menu Fix v1.0"
        InstallRoot = $root
        Files = @($entries)
        InputIniExisted = $iniExisted
    }
    $json = $manifest | ConvertTo-Json -Depth 5
    [IO.File]::WriteAllText((Join-Path $backup "manifest.json"), $json)

    foreach ($f in $files) {
        $rel = $f.FullName.Substring($runtime.Length).TrimStart([char[]]@('\','/'))
        $dest = Join-Path (Join-Path $root "bin") $rel
        New-Item -ItemType Directory -Path (Split-Path $dest -Parent) -Force | Out-Null
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
    }

    if (!$iniExisted) {
        [IO.File]::WriteAllText($ini, "", (New-Object System.Text.UTF8Encoding($false)))
    }
    $text = [IO.File]::ReadAllText($ini)
    if ($text -notmatch '(?im)^\s*touchpad_left\s*=\s*g\s*$') {
        if ($text.Length -eq 0) { $append = "touchpad_left = g`r`n" }
        elseif ($text.EndsWith("`n")) { $append = "touchpad_left = g`r`n" }
        else { $append = "`r`ntouchpad_left = g`r`n" }
        [IO.File]::AppendAllText($ini, $append, [Text.Encoding]::ASCII)
    }

    Write-Host "Installation complete."
    Write-Host "Backup saved at: $backup"
    Write-Host "The existing launcher and co-op bridge were preserved."
} catch {
    Write-Host "INSTALL FAILED: $_" -ForegroundColor Red
    Write-Host "If files were copied, check the Backups folder in the target installation."
    exit 1
}
