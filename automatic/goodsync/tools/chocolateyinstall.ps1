$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = "MSI"

  url            = 'https://www.goodsync.com/download/GoodSync-vsub-Server-Setup.exe'
  checksum       = 'f6c2db23fdde15a1c67e6e2550e0c33449c9884b078b97681cfefd89371a6f97'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
