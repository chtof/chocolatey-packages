$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://archive.basilisk-browser.org/2024.10.24/windows/x86_32/basilisk-20241023020154.win32.installer.exe'
  checksum       = '5af09b5db66839d747fd18e423a9c80760cc53aff0cc0a61fbd96e5b8c0d0dc1'
  checksumType   = 'sha256'

  url64          = 'https://archive.basilisk-browser.org/2024.10.24/windows/x86_64/basilisk-20241023020213.win64.installer.exe'
  checksum64     = '1cd1be67ff2550ea355887da41353228042b3efc98a70b75f1c96f32773a252e'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
