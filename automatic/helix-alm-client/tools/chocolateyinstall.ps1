$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://filehost.perforce.com/alm/helixalm/r2026.2.0/ttwinclientinstall.exe'
  checksum     = '2ac68211e93a936c298b2997d1e0abc6be13c965270295c4edec805eaf85c61c'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
