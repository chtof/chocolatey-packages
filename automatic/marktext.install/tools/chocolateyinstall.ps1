$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64        = 'https://github.com//marktext/marktext/releases/download/v0.21.2/marktext-win-x64-0.21.2-setup.exe'
  checksum64   = '561f691da22750797bec07815bb8eb601b8c0c0d255d8a09031783f340b05579'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
