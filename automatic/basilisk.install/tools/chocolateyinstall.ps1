$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20250703133412.win32.installer.exe'
  checksum       = '95b9615c78dc626729353768ecbdd684dc9b1dfe9db15fa36d296c8a1455eca9'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20250703133404.win64.installer.exe'
  checksum64     = '0be9f04f23063fac86239d1f436e4bc9822710fb7f9b397f76b9afe5b51af245'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
