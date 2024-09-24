PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell -File "%USERPROFILE%\AutoCAD Commands\UpdateAgent.ps1" >> "%TEMP%\StartupLog.txt" 2>&1