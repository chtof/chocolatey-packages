$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  url            = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.13/huggle_3.4.13.exe'
  checksum       = 'b16c79e0bc1e6827eb82fcf540a2d192ce95e0659dc1adb5ad13672686bd6fc0'
  checksumType   = 'sha256'

  url64          = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.13/huggle_3.4.13_x64.exe'
  checksum64     = 'eeee6f289ee799724dfd027d1f1b33a10a1d84eea14f37679641ada5aeb19512'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
