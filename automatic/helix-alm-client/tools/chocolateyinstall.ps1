$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2024.3.0/ttwinclientinstall.exe'
  checksum     = '8e23fcd549352f4988012c3a0e9a4b5ea5e18aa9e3b9e97b2ac18028918baffa'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
