$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20250613175206.win32.installer.exe'
  checksum       = '0c9c868e546ef7d6553452492a75eeda00ad9d8aed20197051963e0e80efe15f'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20250613175044.win64.installer.exe'
  checksum64     = 'a4d5f1da0ddb4b038706b654fd126d32e8dd760f4bfb619c0006fe5b433de6f5'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
