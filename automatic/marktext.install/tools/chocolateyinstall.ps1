$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.21.1/marktext-win-x64-0.21.1-setup.exe'
  checksum64   = '7843c4fc791e85f9824619946e802e2cf79fc790cadb1a98ce86e0a330432fed'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
