$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = "MSI"

  url            = 'https://www.goodsync.com/download/GoodSync-vsub-Server-Setup.exe'
  checksum       = 'fb87047145f05ea69d959a789ff90c0568ee66aaad8c9fd4c3b4b33e34e959f5'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
