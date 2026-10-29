$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-FirestormOS-Releasex64_AVX2-7-2-5-81788_Setup.exe'
  checksum64     = 'b869784c92aa8a81bdd9497c97a5db62e22138cb22440fc4b1d66180276a7a9d'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs