$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20260309164956.win32.installer.exe'
  checksum       = 'babf9b376b75124d935bea8f1001714de1546832ad19bf560bd7500f89a2b10e'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20260309204654.win64.installer.exe'
  checksum64     = 'ba8ad91128d28fd438f3df51a201608cae9a250b2cc6d9b7e637dd6b9830d3be'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
