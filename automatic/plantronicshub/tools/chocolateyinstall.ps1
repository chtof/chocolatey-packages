$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
  checksum     = 'F7A0C184ECA4BC9BBC025BBC9ADDF81801AE0DC6C6A36BB7A3F1942C21EEFE04'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
