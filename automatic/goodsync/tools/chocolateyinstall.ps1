$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = "MSI"

  url            = 'https://www.goodsync.com/download/GoodSync-vsub-Server-Setup.exe'
  checksum       = 'eb5bc9e6e97e42113af7a6e87a3030bf61d1f26eddd8dc7f78a69c3ce921cd9b'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
