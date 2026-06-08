$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.19.1/marktext-win-x64-0.19.1-setup.exe'
  checksum64   = '0de6c0aa854728f3e5c21d74b4138f0a515d70cd80921eb3aed6b8e975838a2f'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
