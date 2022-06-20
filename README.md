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

