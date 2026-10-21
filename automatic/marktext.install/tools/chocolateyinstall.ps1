$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.23.0/marktext-win-x64-0.23.0-setup.exe'
  checksum64   = '49bf66035f92072ce7dd8fa2f88b91f7036d674c05f872355a2d6e366fc53964'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
