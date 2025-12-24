$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree16.0.0.0.msi'
  checksum      = '3b07c2f9ba6c9573a12fc6782b3000c5c8d03eeb6db6856252fe0083d215861b'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree16.0.0.0x64.msi'
  checksum64    = '92982eb51cc52f28225cbcb7f12627e18e56984fb342cbe156ae64188de2be70'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
