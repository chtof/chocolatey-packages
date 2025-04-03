$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_10_32_v2142.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_10_64_v2142.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( ( [environment]::OSVersion.Version.Major -ge 7 ) -or
           ( ( [environment]::OSVersion.Version.Major -eq 6 ) -and
             ( [environment]::OSVersion.Version.Minor -eq 1 ) ) ) {
  $url32_win7_81      = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v2132.msi'
  $checksum32_win7_81 = '1ae2b518274955e6e4a3f1baa23ba7d9f629fa06f5f6a4f4bd3f9a70542a30d4'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://downloads.spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v2132.msi'
  $checksum64_win7_81 = '956cda7e82cc47a3e6d54f7e9dd2ec2cdc99c90c63a7fd5b42508019f3e495a5'
  $url64              = $url64_win7_81
  $checksum64         = $checksum64_win7_81  
} else {
  throw "spacedesk-server runs only with Windows 10, windows 8.1 and windows 7."
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'

  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  silentArgs	   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
