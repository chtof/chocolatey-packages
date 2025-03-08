$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '4cbb9d76b1d3fd191941fa1a83cc7bdd9592e4ab9248d2817b7ef5474182e249'
  checksumType64 = 'sha256'

  silentArgs     = "-q"
}

Install-ChocolateyPackage @packageArgs
