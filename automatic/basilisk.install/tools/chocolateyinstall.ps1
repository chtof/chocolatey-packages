$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20250220144852.win32.installer.exe'
  checksum       = '757a542ed6969ad0e92ba4782a95b4eef364a7a37b1af92b8d1079ff5c130d6c'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20250220144843.win64.installer.exe'
  checksum64     = '1a2066a4508d1c4af417fe2dd3cbe55fe2f8d481bc3eb4617c7147416c3bca27'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
