# UpdateAgent

## Setup for new user

### Required once for new user (requires administrator privileges)

1. Press the `Start ⊞` button and search _Windows PowerShell_.
1. Right-click the Windows PowerShell icon and click _Run as administrator_.
1. Run the command `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine` and choose `Yes All` at the resulting prompt.
1. [Download](https://github.com/gmep-engineers/UpdateAgent/archive/refs/heads/main.zip) the contents of this repository in a zip file.
1. Right-click the zip file and click _Properties_.
1. If there is a _Security_ field at the bottom of the Properties dialog, check _Unblock_. Otherwise continue.
1. Unzip the contents and right-click `Installer.ps1` and click _Run with PowerShell_. The PowerShell window will close on its own upon completion.

## Setting up `APPLOAD` in AutoCAD

### Required once after installing AutoCAD and performing the previous steps

1. Open AutoCAD
1. Type `APPLOAD` and hit Enter.
1. Under _Startup Suite_, click _Contents_.
1. Click _Add_.
1. In the top file path textbox, paste `%USERPROFILE%\Documents\Scripts` and hit `Enter ↵`.
1. Select all `AutoLISP Application` files and click _Open_.
1. Click _Close_ to close the Startup Suite window.
1. Click _Close_ to close the Load/Unload Applications window.
1. Close and reopen AutoCAD. Click _Always Load_ at the security prompts.
