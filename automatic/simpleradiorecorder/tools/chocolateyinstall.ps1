$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         =  "$toolsDir\\SRR Setup 1.2.7.1.exe"

  url           = 'https://dennisbabkin.com/php/downloads/simple_radio_recorder.zip'
  checksum      = '84837FCDF35723D3CFF6B90E5A360DF388A9891B129A00FFEFE68C308F803518'
  # 9d2b1a09b90a72c98591b3d8d57713a42fa8efe6ae25689900271f1ef0b03a73 on 30/12/2025
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs