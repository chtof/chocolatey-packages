$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  fileType      = 'MSI'
  url           = 'https://cdn.screenpresso.com/binaries/releases/v2-4-03-000/dotnet47/ScreenpressoSetup.msi'

  checksum      = '949db7d692dc6fb71c5c88c36105a3ba71f7664187e3200ac4a5efa882307350'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
