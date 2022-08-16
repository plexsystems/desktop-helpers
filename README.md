# desktop-helpers

This repository contains tools to help administrators with their use of Plex products.

## Included
### browsers\Launch-Chrome-Plex.ps1
This PowerShell script creates a new, isolated Chrome session every time it is invoked. This is useful for a shared shop floor machine, where multiple users may be signing in at the same time.

To use, download the PowerShell script to the machine and create a shortcut to it for operators to click. By default, the script launches a new, generic UX session. The script takes both `CompanyCode` and `Product` as paramters, to instead launch a Classic or customer-specific UX session:

| Command | For |
| ------- | --- |
|`.\Launch-Chrome-Plex.ps1` | Generic UX session |
|`.\Launch-Chrome-Plex.ps1 -Product UX -CompanyCode edgeent` | Company-specific UX session for Edge Enterprises |
|`.\Launch-Chrome-Plex.ps1 -Product Classic` | Classic session |

## Using the Scripts
PowerShell is a replacement for the Command Prompt in Windows. Windows PowerShell has been installed by default since Windows 7. Versions of Windows back to XP can install PowerShell manually. A cross-platform version of PowerShell, previously called PowerShell Core, also exists for Windows, MacOS, and Linux. All scripts are confirmed to work under both Windows PowerShell (`powershell.exe`) and the cross-platform PowerShell (`pwsh.exe`).

To invoke a PowerShell script, download it from this repository. Advanced users may use `git clone` to pull the entire repository, but you can also download individual files by nagivating to them, clicking the `Raw` button in the top right corner of the page, and downloading the content that appears.

Once the file exists on your machine, create a shortcut to it. For the shortcut path, enter `powershell.exe -ExecutionPolicy Bypass -File ""`, where the path to the script is in quotes. If you wish to pass in additional parameters, you can do so by appending them to the end of the shortcut path: `powershell.exe -ExecutionPolicy Bypass -File "" -Product Classic -CompanyCode edgeent`.

If upon launching your shortcut, nothing happens, try appending `-noexit` after `powershell.exe` to read the error message that appears.