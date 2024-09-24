# UpdateAgent
## Setup for new user
### Required once for new user
1. Download and unzip the contents of this repository.
1. Press `Win+R` to open the Run dialog.
1. Paste `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\` in the run dialog. Hit Enter.
1. Copy `startup.cmd` to the `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\` folder.
1. Press `Win+R`
1. Paste `%USERPROFILE%` in the run dialog. Hit Enter.
1. Create a folder titled `AutoCAD Commands`.
1. Copy `UpdateAgent.ps1` to the `AutoCAD Commands` folder.
1. Right-click `UpdateAgent.ps1` and click *Run with PowerShell*.

## Setting up `APPLOAD` in AutoCAD
### Required once after installing AutoCAD and performing the previous steps
1. Open AutoCAD
1. Type `APPLOAD` and hit Enter.
1. Under *Startup Suite*, click *Contents*.
1. Click *Add*.
1. In the File Name textbox, paste `%USERPROFILE%\AutoCAD Commands\load_dll.lsp`
1. Click *Open*.
1. Click *Close* to close the Startup Suite window.
1. Click *Close* to close the Load/Unload Applications window.
1. Close and reopen AutoCAD. Click *Always Load* at the security prompt.