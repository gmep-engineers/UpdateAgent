$localDestDir = "$Env:userprofile\AutoCAD Commands"
# Copy-Item .\startup.cmd -Destination "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"
mkdir -Force -Path "$localDestDir"
Copy-Item .\UpdateAgent.ps1 -Destination "$localDestDir"
& $localDestDir\UpdateAgent.ps1
$shell = New-Object -comObject WScript.Shell
$shortcut = $shell.CreateShortcut("$Env:userprofile\Desktop\Update AutoCAD Commands.lnk")
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$localDestDir\UpdateAgent.ps1`""
$shortcut.Save()