$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.0.0.msi'
  checksum      = '87f0c515e6857c19b48ba1dcd6574da94396c4e3704540f8fe730d77deaccc86'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.0.0x64.msi'
  checksum64    = '81ae22be0204b30db9a883a5ebf7576fa3204baf4c33760f10afb755bed646d6'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
