$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20260922234903.win32.installer.exe'
  checksum       = 'b9ac94746f2ae515cc0232edc628d532cca81da1c9d67d22a5c036b9fb2279ce'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20260922233924.win64.installer.exe'
  checksum64     = 'aa82e18d93cdddef7ab11dc826c2560309ef0b7d2020b51da69d538ebc84e48f'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
