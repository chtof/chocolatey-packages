$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack15.0.6000.0.msi'
  checksum      = 'dbe758b0ca9dac39a6e3ec41a39f45a5387f661221cb95a80d889adb746866a5'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack15.0.6000.0x64.msi'
  checksum64    = 'db3c83d610cc3dd5cfddd40e62e55746c84eb0e067588f12209ab8558976f227'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
