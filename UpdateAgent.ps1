# 2024-09-23: This currently only covers GMEPElectricalCommands.
# Expand this file to cover the other command suites when they are ready to be integrated into the UpdateAgent.
$zDriveSourceDir = "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands"
$localDestDir = "$Env:userprofile\AutoCAD Commands"
$repos = @(
    [pscustomobject]@{name="GMEPElectricalCommands";dll="ElectricalCommands.dll"},
    [pscustomobject]@{name="GMEPElectricalResidential";dll="GMEPElectricalResidential.dll"}
)
foreach($repo in $repos) {
    try {
        $name = $repo.name
        $dll = $repo.dll
        $zDriveDll = Get-Item "$zDriveSourceDir\$name\latest\$dll" -ErrorAction Stop
        $localDll = Get-Item "$localDestDir\$name\$dll" -ErrorAction Stop
        if ($zDriveDll.CreationTime -gt $localDll.CreationTime) {
            Copy-Item -Path "$zDriveSourceDir\$name\latest\*" -Destination "$localDestDir\$name" -Recurse
            Get-ChildItem -Recurse "$localDestDir\$name" | Unblock-File
        }
    } catch {
        mkdir -Force -Path "$localDestDir\$name"
        Copy-Item -Path "$zDriveSourceDir\$name\latest\*" -Destination "$localDestDir\$name" -Recurse
        Get-ChildItem -Recurse "$localDestDir\$name" | Unblock-File
    }
}

try {
    $zDriveLsp = Get-Item "$zDriveSourceDir\load_dll.lsp" -ErrorAction Stop
    $localLsp = Get-Item "$localDestDir\load_dll.lsp" -ErrorAction Stop
    if ($zDriveLsp.CreationTime -gt $localLsp.CreationTime) {
        Copy-Item "$zDriveSourceDir\load_dll.lsp" -Destination "$localDestDir"
        Get-Item "$localDestDir\load_dll.lsp" | Unblock-File
        (Get-Content "$localDestDir\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$localDestDir\load_dll.lsp"
    }
} catch {
    Copy-Item "$zDriveSourceDir\load_dll.lsp" -Destination "$localDestDir"
    Get-Item "$localDestDir\load_dll.lsp" | Unblock-File
    (Get-Content "$localDestDir\load_dll.lsp") -replace "%USERPROFILE%", "$Env:userprofile" -replace "\\", "/" | Out-File "$localDestDir\load_dll.lsp"
}