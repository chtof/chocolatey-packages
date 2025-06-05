$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2024_9_149_32.msi'
  checksum32    = '77f153a4ee286b9b90588c6961373ada80f4b67abca0ff74596f3b4884bb382e'
  url64         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2025_5_5.msi'
  checksum64    = 'bb7a3a12de0c8ffe00fbefdb3a973b18cad4f5684ff2f12f8ae695d66e239bb1'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
