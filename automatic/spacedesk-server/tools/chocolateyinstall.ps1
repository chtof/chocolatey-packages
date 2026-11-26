$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url32          = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_10_32_v2236.msi'
  checksum32     = '27053d5eecff7164f44690c67cd1b6653293ec5fbe39bcdaefcbc0ba41eb7757'
  checksumType   = 'sha256'

  url64          = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_11_64_v2236.msi'
  checksum64     = '64af2ea5cf1f25929b1c8cf43b7b14325e3dcf689ab7e0079cd7a02f13d3f364'
  checksumType64 = 'sha256'

  silentArgs	   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
