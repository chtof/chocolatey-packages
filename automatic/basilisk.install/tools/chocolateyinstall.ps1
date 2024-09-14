$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://archive.basilisk-browser.org/2024.09.13/windows/x86_32/basilisk-20240912184256.win32.installer.exe'
  checksum       = 'b636c7743011cd5623650f3b22319f052dde8222d41323793f36366383d44516'
  checksumType   = 'sha256'

  url64          = 'https://archive.basilisk-browser.org/2024.09.13/windows/x86_64/basilisk-20240912184157.win64.installer.exe'
  checksum64     = 'ad189e59f85f3f88dbef7eda9ad31ee493ef80697ebed7cc64392ee7f6555cda'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
