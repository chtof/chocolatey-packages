$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://files.ia.net/writer/windows/2.1.9644.17275/iawriter-2.1.9644.17275-build20260528-release.exe'
  checksum      = '71ab90403b0a029da292154ae340881eed3e1bb752e42f2b79ebc853e8126fce'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
