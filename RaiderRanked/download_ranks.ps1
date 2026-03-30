$ErrorActionPreference = "Stop"
$base = "https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-static-assets/global/default"
$root = $PSScriptRoot

$ranks = @("challenger","grandmaster","master","diamond","emerald","platinum","gold","silver","bronze","iron","unranked")

function Download($url, $dest) {
    $dir = Split-Path $dest -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Write-Host "  [OK] $dest"
    } catch {
        Write-Host "  [FAIL] $url"
    }
}

Write-Host "=== Mini-crests (Rank Frame / Minimap) ==="
foreach ($r in $ranks) {
    $url = if ($r -eq "emerald") {
        "$base/images/ranked-emblem/emblem-emerald.png"
    } else {
        "$base/images/ranked-mini-crests/$r.png"
    }
    Download $url "$root\Media\Ranks\$r.png"
}

Write-Host "=== Full emblems (Animation) ==="
$emblemRanks = @("challenger","grandmaster","master","diamond","emerald","platinum","gold","silver","bronze","iron")
foreach ($r in $emblemRanks) {
    Download "$base/images/ranked-emblem/emblem-$r.png" "$root\Media\Emblems\emblem-$r.png"
}

Write-Host "=== Wings (Animation overlay) ==="
foreach ($r in $emblemRanks) {
    Download "$base/images/ranked-emblem/wings/wings_$r.png" "$root\Media\Wings\wings_$r.png"
}

Write-Host "Done."
