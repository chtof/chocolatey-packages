$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack16.0.0000.0.msi'
  checksum      = '5b997e242d949a39568bc2adb1e5ea9b6ed724ecad0d7fd977141eddd324c6cf'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack16.0.0000.0x64.msi'
  checksum64    = 'f80b3874a79497cc3e6cbc31869114c54cb23b0ccc0f696216a85834f53dad6b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
