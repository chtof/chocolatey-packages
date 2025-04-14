$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.3.0.msi'
  checksum      = '979976d852d9b0d8ea812a2eece28f0b1e3d55eb3c268c3ca3fd4af04874935c'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree15.0.3.0x64.msi'
  checksum64    = 'ecf409610f43a674f7434a429585fe6ebc1b8fdf09f003ac82bd294dc3a306d1'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
