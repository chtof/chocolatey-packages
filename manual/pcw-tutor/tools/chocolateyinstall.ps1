$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\PCW-Tutor-7.1.1-setup.exe"
  silentArgs    = '/SILENT'

  url           = 'https://www.qsl.net/dj7hs/PCW-Tutor-setup.zip'
  checksum      = '56870018841091e19b0481cce45e7bd033a37a8a49504710da0f41fe1f434798'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs
#Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
