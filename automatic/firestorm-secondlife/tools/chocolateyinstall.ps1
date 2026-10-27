$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Releasex64_AVX2-7-2-5-81788_Setup.exe'
  checksum64     = 'faac17c3507e14f9a26f6cec2568df00b7e93a8af792522f72b4a4421236b0f0'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
