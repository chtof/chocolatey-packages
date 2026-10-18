$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.22.0/marktext-win-x64-0.22.0-setup.exe'
  checksum64   = 'f710518d5559998515a3799ab4a74d971dd1436532048d3d9d62e808fef4001f'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
