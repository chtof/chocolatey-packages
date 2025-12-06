$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://downloads.spacedesk.net/downloads/spacedeskWindowsVIEWER_v0948_BETA.msi'
  checksum      = '415be9aa8665f8c8cd6bd0007873e4ed390e8dfb6ba3d37616a962f2a0c5e82c'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
