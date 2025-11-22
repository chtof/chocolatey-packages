$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://manager.azirevpn.com/assets/dl/azirevpn.msi'
  checksum      = '5d19f85a83602211ecaf28cb52869842c3d2dcff3737c6d3cc4160180e161bbb'
  checksumType  = 'sha256'
  
  silentArgs  = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
