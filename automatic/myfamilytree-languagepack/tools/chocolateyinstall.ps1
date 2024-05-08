$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.4000.0.msi'
  checksum      = '0bba792da2eba14c64eefd43ec2e051f15e22ca5cbfe37baca89aafe9ff7d064'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.4000.0x64.msi'
  checksum64    = '7beb35d87639011ab669226e1f28f4d0088bf7c64d7bd5be5a8ab8e1bd4ba57b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
