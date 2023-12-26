﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$processName = 'BBCiPlayerDownloads'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  

  url           = 'https://static.files.bbci.co.uk/iplayer-pc-download-app/releases/win32-x64/BBCiPlayerDownloadsSetup-2.13.18.exe'
  checksum      = '6e97215f314290865f97edec2e50bb2bb54d236c0ce013b1df4c846352ecd649'
  checksumType  = 'sha256'
  
  silentArgs    = ''
}

Install-ChocolateyPackage @packageArgs

# Kill application as it starts automatically
While (-Not (Get-Process -Name $processName -ErrorAction SilentlyContinue) ) {
  Sleep 2
}
Stop-Process -Name $processName