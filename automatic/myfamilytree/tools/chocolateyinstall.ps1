$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree16.2.0.0x86.msi'
  checksum      = 'dd77a04853e55cba93793611e2485f169bfb9b16618cfaa165a051e9de0ed774'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree16.2.0.0x64.msi'
  checksum64    = 'a2c4838b633498169fa289efbc7f6d9c50ce3d782fe431e9c7445b3ab6eeae9a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
