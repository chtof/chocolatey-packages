$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2024.2.0/ttwinclientinstall.exe'
  checksum     = '9ebc29a843132a4e814e2c5e1c79885c75a651be9abac919c0382127e8e0bc0b'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
