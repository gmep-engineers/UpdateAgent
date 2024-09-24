$localDestDir = "$Env:userprofile\AutoCAD Commands"
Copy-Item .\startup.cmd -Destination "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"
mkdir -Force -Path "$localDestDir"
Copy-Item .\UpdateAgent.ps1 -Destination "$localDestDir"
& $localDestDir\UpdateAgent.ps1