$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20250422154345.win32.installer.exe'
  checksum       = 'b1c8b770d767fb21f3b320e6c98494d6219764468d3e7b2a419efbd701e1d82d'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20250422154345.win64.installer.exe'
  checksum64     = 'aea84dc5cca8d16388be7e8d2a2b97d50c7c106ad3457d227f8657ea2fec7a29'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
