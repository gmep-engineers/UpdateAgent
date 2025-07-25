$zDriveSourceDir = "Z:\GMEP Engineers\Users\GMEP Softwares\AutoCAD Commands"
$localDestDir = "$Env:userprofile\Documents\Scripts"
$formattedDestDir = $localDestDir -replace "\\", "/"
$repos = @(
    [pscustomobject]@{name = "GMEPElectricalCommands"; dll = "ElectricalCommands.dll"; lsp = "GMEPElectricalCommands.lsp" },
    [pscustomobject]@{name = "GMEPElectricalResidential"; dll = "GMEPElectricalResidential.dll"; lsp = "GMEPElectricalResidential.lsp" },
    [pscustomobject]@{name = "GMEPSolar"; dll = "GMEPSolar.dll"; lsp = "GMEPSolar.lsp" },
    [pscustomobject]@{name = "GMEPPlumbing"; dll = "GMEPPlumbing.dll"; lsp = "GMEPPlumbing.lsp" }
)
foreach ($repo in $repos) {
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
    }
    catch {
        mkdir -Force -Path "$localDestDir\$name"
        Copy-Item -Force -Path "$zDriveSourceDir\$name\latest\*" -Destination "$localDestDir\$name" -Recurse
        Get-ChildItem -Recurse "$localDestDir\$name" | Unblock-File
        Write-Output "(command `"netload`" `"$formattedDestDir/$name/$dll`")" | Out-File -FilePath "$localDestDir\$lsp"
    }
}


$nodeGraphSourcePath = "Z:\GMEP Engineers\Users\GMEP Softwares\GMEPNodeGraph.zip"
Copy-Item -Force -Path "$nodeGraphSourcePath" -Destination "$localDestDir"
Unblock-File "$localDestDir\GMEPNodeGraph.zip"
Expand-Archive -Force -Path "$localDestDir\GMEPNodeGraph.zip" -DestinationPath "$localDestDir\GMEPNodeGraph"

$designToolSourcePath = "Z:\GMEP Engineers\Users\GMEP Softwares\GMEPDesignTool.zip"
Copy-Item -Force -Path "$designToolSourcePath" -Destination "$localDestDir"
Unblock-File "$localDestDir\GMEPDesignTool.zip"
Expand-Archive -Force -Path "$localDestDir\GMEPDesignTool.zip" -DestinationPath "$localDestDir\GMEPDesignTool"
Set-Location "$localDestDir\GMEPDesignTool"
PowerShell "$localDestDir\GMEPDesignTool\Install.ps1"

$title24SourcePath = "Z:\GMEP Engineers\Users\GMEP Softwares\GMEPTitle24.zip"
Copy-Item -Force -Path "$title24SourcePath" -Destination "$localDestDir"
Unblock-File "$localDestDir\GMEPTitle24.zip"
Expand-Archive -Force -Path "$localDestDir\GMEPTitle24.zip" -DestinationPath "$localDestDir\GMEPTitle24"
Set-Location "$localDestDir\GMEPTitle24"
PowerShell -NoExit "$localDestDir\GMEPTitle24\Install.ps1"
