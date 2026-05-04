$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\PCW-Fistcheck-3.9.9.2-setup.exe"
  silentArgs    = '/SILENT'

  url           = 'https://www.qsl.net/dj7hs/PCW-Fistcheck-setup.zip'
  checksum      = '7b42705df4001668dcf9b586f1bdd1ecacba91edc3634b510d5547a10066a542'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs
#Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
