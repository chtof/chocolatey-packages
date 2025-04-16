$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.5.0.msi'
  checksum      = 'f34810fdfe54cdb7a99ec16a123a8212ea56b4d27881f0d10132d55b8930eeda'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.5.0x64.msi'
  checksum64    = '1eaf52ba29af6ef3a28056da02134ebe23854acc604613b9b9e0e6fa04343691'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
