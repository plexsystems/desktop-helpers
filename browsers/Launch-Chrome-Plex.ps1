<#

.SYNOPSIS
A PowerShell script to open Plex products in a new, isolated profile.

.DESCRIPTION
When multiple users are concurrently active at a computer, running Plex products at the same time,
sessions can become mingled. This script creates new Chrome profiles for each launch and provides
fully-isolated sessions that users can work in.

.PARAMETER Product
The product to open (`UX` or `Classic`); defaults to `UX`

.PARAMETER CompanyCode
The company code, used to generate customer-specific URLs for UX

.PARAMETER BlankProfile
If set, uses a blank profile rather than copying the Default profile
#>

[CmdletBinding()]
Param(
  [ValidateSet("UX", "Classic")]
  [string]$Product = "UX",
  [string]$CompanyCode = "",
  [switch]$BlankProfile = $false
)

$userData = Join-Path $env:LOCALAPPDATA "\Google\Chrome\User Data\";
$cleanupDate = (Get-Date).AddDays(-1);

Get-ChildItem -Path $userData -Filter "TempPlexProfile*" | where LastWriteTime -lt $cleanupDate | Remove-Item -Force -Recurse -Confirm:$false;

$unixEpoch = (Get-Date 1970-01-01Z).ToUniversalTime();
$id = [System.Math]::Round([System.DateTime]::Now.ToUniversalTime().Subtract($unixEpoch).TotalSeconds);
$newDataDir = ($userData + "TempPlexProfile" + $id);

if ($BlankProfile) {
  mkdir $newDataDir > $null;
} else {
  Copy-Item -Path ($userData + "Default\") -Destination $newDataDir -Recurse;
}

if ($Product -eq "Classic") {
  $url = "https://www.plexonline.com/signon";
} elseif ([System.String]::IsNullOrWhitespace($CompanyCode)) {
  $url = "https://cloud.plex.com/sso";
} else {
  $url = "https://" + $CompanyCode + ".on.plex.com/sso";
}

Start-Process chrome.exe -ArgumentList "--disable-popup-blocking", "--user-data-dir=""$newDataDir""", $url