$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://archive.basilisk-browser.org/2024.11.23/windows/x86_32/basilisk-20241122173240.win32.installer.exe'
  checksum       = '4abd7cee226c330db675bbb4f1c94f68c72cf8aa57c42bb3b15b8a1cf327917d'
  checksumType   = 'sha256'

  url64          = 'https://archive.basilisk-browser.org/2024.11.23/windows/x86_64/basilisk-20241122173226.win64.installer.exe'
  checksum64     = '93927fd63c27d15b56117044377ff9a11d99ec9ecb5f5c80780ea764990832d8'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
