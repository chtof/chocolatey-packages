$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Releasex64_AVX2-7-2-4-80712_Setup.exe'
  checksum64     = '46eff19c0030c2e9de56255d71ac476088ed170949a8a845821e7ff7acda16a0'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
