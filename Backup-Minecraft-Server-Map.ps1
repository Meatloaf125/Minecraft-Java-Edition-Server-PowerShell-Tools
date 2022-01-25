# Minecraft Java Edition Server Map Backup Script
# Stop your server before running this script, otherwise you may have issues with the backup files.

$DateTime = Get-Date -Format "yyyy-MM-dd_HHmm"

# Server map folder--change this to wherever yours is
$ServerFolder = "$env:appdata\.minecraft\server\world"

# Location where you'd like to back everything up
$BackupFolder = "P:\backups\minecraft\Current Server World\"
$TargetLocation = $BackupFolder + $DateTime
Set-Location "P:\backups\minecraft\Current Server World\"

Write-Host "Current backup folders:" -ForegroundColor Cyan
Get-ChildItem
Write-Host "`nCreating new folder, $DateTime...`n" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $TargetLocation

Write-Host "Copying data.  This may take a few minutes..." -ForegroundColor Cyan
Copy-Item -Recurse $ServerFolder -Destination $TargetLocation
Write-Host "Done!" -ForegroundColor Green