# UpdateAgent
## Setup for new user
### Required once for new user
1. Download and unzip the contents of this repository.
1. Right-click `Installer.ps1` and click *Run with PowerShell*.

## Setting up `APPLOAD` in AutoCAD
### Required once after installing AutoCAD and performing the previous steps
1. Open AutoCAD
1. Type `APPLOAD` and hit Enter.
1. Under *Startup Suite*, click *Contents*.
1. Click *Add*.
1. In the top file path textbox, paste `%USERPROFILE%\AutoCAD Commands` and hit Enter.
1. Select all `.lsp` files and click *Open*.
1. Click *Close* to close the Startup Suite window.
1. Click *Close* to close the Load/Unload Applications window.
1. Close and reopen AutoCAD. Click *Always Load* at the security prompt.