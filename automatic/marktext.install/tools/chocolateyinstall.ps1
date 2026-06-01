$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.19.0/marktext-win-x64-0.19.0-setup.exe'
  checksum64   = 'b7981442a29b281fe8b58e2285c9760f8d12d145fbeaefa32dc3b436d1fd4f72'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
