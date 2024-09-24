# 2024-09-23: This currently only covers GMEPElectricalCommands.
# Expand this file to cover the other command suites when they are ready to be integrated into the UpdateAgent.
$zDriveSourceDir = "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands"
$localDestDir = "$Env:userprofile\AutoCAD Commands"
try {
    $zDriveDll = Get-Item "$zDriveSourceDir\GMEPElectricalCommands\latest\ElectricalCommands.dll" -ErrorAction Stop
    $localDll = Get-Item "$localDestDir\GMEPElectricalCommands\ElectricalCommands.dll" -ErrorAction Stop
    if ($zDriveDll.CreationTime -gt $localDll.CreationTime) {
        Copy-Item -Path "$zDriveSourceDir\GMEPElectricalCommands\latest\*" -Destination "$localDestDir\GMEPElectricalCommands" -Recurse
        Copy-Item -Path "$zDriveSourceDir\load_dll.lsp" -Destination "$localDestDir"
        Get-ChildItem -Recurse "$localDestDir\GMEPElectricalCommands\" | Unblock-File
        (Get-Content "$localDestDir\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$localDestDir\load_dll.lsp"  
    }
} catch {
    mkdir -Force -Path "$localDestDir\GMEPElectricalCommands"
    Copy-Item -Path "$zDriveSourceDir\GMEPElectricalCommands\latest\*" -Destination "$localDestDir\GMEPElectricalCommands" -Recurse
    Copy-Item -Path "$zDriveSourceDir\load_dll.lsp" -Destination "$localDestDir"
    Get-ChildItem -Recurse "$localDestDir\GMEPElectricalCommands\" | Unblock-File
    (Get-Content "$localDestDir\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$localDestDir\load_dll.lsp"
}