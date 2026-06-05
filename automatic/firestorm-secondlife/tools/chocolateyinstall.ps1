$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Releasex64_AVX2-7-1-11-76496_Setup.exe'
  checksum64     = '2780ec1f489bbfca7db03465759e14f06b6213cb8be07731c1d6e5319cb05ba1'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
