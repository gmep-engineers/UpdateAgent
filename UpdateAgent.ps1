$zDriveSourceDir = "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands"
$localDestDir = "$Env:userprofile\AutoCAD Commands"
$formattedDestDir = $localDestDir -replace "\\", "/"
$repos = @(
    [pscustomobject]@{name="GMEPElectricalCommands";dll="ElectricalCommands.dll";lsp="GMEPElectricalCommands.lsp"},
    [pscustomobject]@{name="GMEPElectricalResidential";dll="GMEPElectricalResidential.dll";lsp="GMEPElectricalResidential.lsp"}
)
foreach($repo in $repos) {
    $name = $repo.name
    $dll = $repo.dll
    $lsp = $repo.lsp
    try {
        $zDriveDll = Get-Item "$zDriveSourceDir\$name\latest\$dll" -ErrorAction Stop
        $localDll = Get-Item "$localDestDir\$name\$dll" -ErrorAction Stop
        if ($zDriveDll.CreationTime -gt $localDll.CreationTime) {
            Copy-Item -Force -Path "$zDriveSourceDir\$name\latest\*" -Destination "$localDestDir\$name" -Recurse
            Get-ChildItem -Recurse "$localDestDir\$name" | Unblock-File
            Write-Output "(command `"netload`" `"$formattedDestDir/$name/$dll`")" | Out-File -FilePath "$localDestDir\$lsp"
        }
    } catch {
        mkdir -Force -Path "$localDestDir\$name"
        Copy-Item -Force -Path "$zDriveSourceDir\$name\latest\*" -Destination "$localDestDir\$name" -Recurse
        Get-ChildItem -Recurse "$localDestDir\$name" | Unblock-File
        Write-Output "(command `"netload`" `"$formattedDestDir/$name/$dll`")" | Out-File -FilePath "$localDestDir\$lsp"
    }
}
