$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack15.0.0000.0.msi'
  checksum      = '2b2b06686bd0f46f58c701b724ea6893b5f9af8bef8a035f51569d91f19c4b93'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack15.0.0000.0x64.msi'
  checksum64    = 'b1fbcdccd8cb7bd8c0432a4504d9e22e07a932124da729d4330d5f04c8e9fda9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
