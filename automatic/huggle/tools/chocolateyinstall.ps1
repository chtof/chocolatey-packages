$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  url            = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.14/huggle_3.4.14.exe'
  checksum       = '1ef89e6c11967bfa9898435ac68cbfa90d2ff2546120c1b2caa9e4fa21fd6b98'
  checksumType   = 'sha256'

  url64          = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.14/huggle_3.4.14_x64.exe'
  checksum64     = 'fba99153e9648e48d9512bc61ef2828629045a453afdca327f58036eb4e182d1'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
