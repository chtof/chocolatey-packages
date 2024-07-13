$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.1.0000.0.msi'
  checksum      = '723b4c08ccaca868ba49282b09ab6193a301707e51c82c9765df9e30832015b2'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.1.0000.0x64.msi'
  checksum64    = '8e2d6f239d6fc242c96e3c382355edad52eee99e1e52f8d2ef559c16808f5fd2'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
