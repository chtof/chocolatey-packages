$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64          = 'https://dl.strem.io/stremio-shell-ng/v5.0.24/StremioSetup-v5.0.24_x64.exe'
  checksum64     = '12dc718e02773d747f85d5aac765cf73915b63c582ea799cc4f9b880f1242842'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
