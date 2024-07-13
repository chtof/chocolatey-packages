$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.1.0.0.msi'
  checksum      = '0f0f6deb30216bd91c5d9dcb242ae163c0b989f5989603a8e0c8d5a9503082ef'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.1.0.0x64.msi'
  checksum64    = '812a462a0d29ed71e6a5c6ceb1f0d8e189b31ac9bd6022e549b7b8be4ef0579a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
