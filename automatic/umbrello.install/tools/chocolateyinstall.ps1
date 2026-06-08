$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.31.2-lp151.49.1-setup.exe'
  url64        = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.31.2-lp151.49.1-setup.exe'
  checksum     = ''
  checksum64     = ''
  checksumType = 'sha256'

  file32       = "$toolsDir\umbrello-mingw64-2.31.2-lp151.121.1-setup.exe"
  file64       = "$toolsDir\umbrello-mingw64-2.31.2-lp151.121.1-setup.exe"

  silentArgs   = '/S'
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
