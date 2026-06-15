$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20260613174904.win32.installer.exe'
  checksum       = 'ca982bf03e159782afea6b45a7f859c6963c19f773deedb8970f874150a43c65'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20260613185748.win64.installer.exe'
  checksum64     = '523380caf5fabe169a541afcf55a1dd4567dbcbf5ae53ae9d33599f5cc496f05'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
