$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url32          = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_10_32_v2235.msi'
  checksum32     = '269798735ea69b1790cf67ce680d0779897b9f34c1823bb9b3a0699562ff5f4e'
  checksumType   = 'sha256'

  url64          = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_11_64_v2235.msi'
  checksum64     = '7c27db729fb66aa64843e5ba21d4793631e52743a7ad58ae9654d444465ca641'
  checksumType64 = 'sha256'

  silentArgs	   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
