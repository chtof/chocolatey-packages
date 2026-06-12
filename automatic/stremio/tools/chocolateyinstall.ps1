$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url64          = 'https://dl.strem.io/stremio-shell-ng/v5.0.22/StremioSetup-v5.0.22_x64.exe'
  checksum64     = '4bbda2e281fe339d9ee9e80d6b8f2642021ed0ad909c72643f97537adac103a0'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
