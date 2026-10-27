$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64bit       = 'https://www.kafkatool.com/download4/offsetexplorer_64bit.exe'
  checksum64     = '6C20D9B2910A50A9401D10F69DE4D8C06B98EB4E9B6858CF273C9D98FF0C7896'
  checksumType64 = 'sha256'

  silentArgs     = '-q'
}

Install-ChocolateyPackage @packageArgs
