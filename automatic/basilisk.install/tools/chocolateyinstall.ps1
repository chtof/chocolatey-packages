$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20260415191012.win32.installer.exe'
  checksum       = '03bbf685ae43a808d6da97c222c1d1981709655237adeff49898f91aaec758e2'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20260415213024.win64.installer.exe'
  checksum64     = '3f3e0d1e75fe812b02ba463911aa7c261a6cb3c4f2eedb08023508f7d116e5cb'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
