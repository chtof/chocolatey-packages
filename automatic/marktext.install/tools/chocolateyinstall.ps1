$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.20.0/marktext-win-x64-0.20.0-setup.exe'
  checksum64   = '4c825f40d1222a3d9dc3acf397ccdf7464d9cb9d89759ee42ba7e0b7354ace4f'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
