# UpdateAgent

## Setup for new user

### Required once for new user (requires administrator privileges)

1. Press the `Start ⊞` button and search _Windows PowerShell_.
1. Right-click the Windows PowerShell icon and click _Run as administrator_.
1. Run the command `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine` and choose `Yes All` at the resulting prompt.
1. [Download](https://github.com/gmep-engineers/UpdateAgent/archive/refs/heads/main.zip) the contents of this repository in a zip file.
1. Right-click the zip file and click _Properties_.
1. If there is a _Security_ field at the bottom of the Properties dialog, check _Unblock_. Otherwise continue.
1. Unzip the contents and right-click `Installer.ps1` and click _Run with PowerShell_.
1. Wait for PowerShell to output `DONE`.

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

### To Update

1. Close AutoCAD.
1. Open a new Windows Explorer window.
1. In the top file path textbox, paste `%USERPROFILE%\Documents\Scripts` and hit `Enter ↵`.
1. Delete the folders `GMEPElectricalCommands`, `GMEPElectricalResidential`, and `GMEPSolar`
1. Right-click `Installer.ps1` and click _Run with PowerShell_.
1. Wait for PowerShell to output `DONE`.

## Extra setup required for new AutoCAD installation

### Fontmap

1. Open AutoCAD.
1. Click the AutoCAD symbol at the very top-left.
1. Click _Options_.
1. Click the _Files_ tab.
1. Expand `Text Editor, Dictionary, and Font File Names`.
1. Expand `Font Mapping File`.
1. Select the current value string.
1. Click _Browse_.
1. Go to `Z:\GMEP Engineers\Electrical Commercial Template\Template CAD`.
1. Double-click `fontmap.fmp`.
1. Click _OK_.

### Profile

1. Open AutoCAD.
1. Click the AutoCAD symbol at the very top-left.
1. Click _Options_.
1. Click the _Profiles_ tab.
1. Click _Import_.
1. Go to `Z:\GMEP Engineers\Projects\2016jobs\AutoCAD Support\Profiles`.
1. Double-click `David  Profile 02-14-19.arg`.
1. Click _Set Current_.
1. Click _OK_.
