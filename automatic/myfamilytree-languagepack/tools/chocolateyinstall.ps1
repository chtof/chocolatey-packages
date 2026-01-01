$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack16.0.1000.0.msi'
  checksum      = 'ebb3dbc8d26bccf893be046a6cb6765a3800c9fb613ad2a93ab758d95abbdc62'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack16.0.1000.0x64.msi'
  checksum64    = '8d5003ead6cd018ff79c4807b3caa5e7fe97d916a56659e7c33419721a85a430'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
