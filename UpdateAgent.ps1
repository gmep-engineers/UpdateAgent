# 2024-09-23: This currently only covers GMEPElectricalCommands.
# Expand this file to cover the other command suites when they are ready to be integrated into the UpdateAgent.
try {
    $zDriveDll = Get-Item "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands\GMEPElectricalCommands\latest\ElectricalCommands.dll" -ErrorAction Stop
    $localDll = Get-Item "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands\ElectricalCommands.dll" -ErrorAction Stop
    if ($zDriveDll.CreationTime -gt $localDll.CreationTime) {
        Copy-Item -Path "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands\GMEPElectricalCommands\latest\*" -Destination "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands" -Recurse
        Copy-Item -Path "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands\load_dll.lsp" -Destination "$Env:userprofile\AutoCAD Commands"
        Get-ChildItem -Recurse "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands\" | Unblock-File
        (Get-Content "$Env:userprofile\AutoCAD Commands\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$Env:userprofile\AutoCAD Commands\load_dll.lsp"  
    }
} catch {
    mkdir -Force -Path "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands"
    Copy-Item -Path "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands\GMEPElectricalCommands\latest\*" -Destination "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands" -Recurse
    Copy-Item -Path "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands\load_dll.lsp" -Destination "$Env:userprofile\AutoCAD Commands"
    Get-ChildItem -Recurse "$Env:userprofile\AutoCAD Commands\GMEPElectricalCommands\" | Unblock-File
    (Get-Content "$Env:userprofile\AutoCAD Commands\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$Env:userprofile\AutoCAD Commands\load_dll.lsp"
}