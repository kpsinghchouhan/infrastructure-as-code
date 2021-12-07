[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [string[]]
    $Source = @("C:\Users\chouhk\OneDrive - Dell Technologies\Documents\Dell",
        "C:\Users\chouhk\OneDrive - Dell Technologies\Documents\DevOps Transition",
        "C:\Users\chouhk\OneDrive - Dell Technologies\Documents\RSA",
        "C:\Personal",
        "C:\Code"),
    [Parameter(Mandatory = $false)]
    [string]
    $Destination = "D:\Backup"
)

# Clean up older backup direcories
Write-Host "Cleaning up older backup files . . . "
Write-Host "Cleanup started at: $(Get-Date)"
Set-Location $Destination
$olderBackupFolders = Get-ChildItem $Destination -Directory | Sort-Object -Property LastWriteTime -Descending

$firstTime = $true
foreach ($folder in $olderBackupFolders) {
    if ($firstTime) {
        $firstTime = $false
        continue
    }
    Remove-Item $folder -Recurse -Force
}
Write-Host "Cleanup finished at: $(Get-Date)"
# Create a new directory with today's date
$currentDate = Get-Date
$backupFolder = $currentDate.ToString('yyyy-MM-dd')
if ( -Not (Test-Path "${Destination}\${backupFolder}")) {
    New-Item -Path $backupFolder -ItemType Directory
}
Set-Location $backupFolder
# Copy each folder to backup folder
Write-Host "Backup started at: $(Get-Date)"
foreach ($folder in $Source) {
    Copy-Item -Path $folder -Destination "${Destination}\${backupFolder}" -Recurse -Force
}

Write-Host "Backup finished at: $(Get-Date)"
