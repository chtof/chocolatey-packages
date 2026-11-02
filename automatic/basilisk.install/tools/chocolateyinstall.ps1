$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20261101213439.win32.installer.exe'
  checksum       = 'af4afd73912b71f5b8a3769983bbf882a8a6de1c6434d001e1cdd3d943bba6e6'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20261101224804.win64.installer.exe'
  checksum64     = 'c4670da9828d6f1c565d02eee8e7a1772bb6b6728b39cf4f682987b104d1b3bb'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
