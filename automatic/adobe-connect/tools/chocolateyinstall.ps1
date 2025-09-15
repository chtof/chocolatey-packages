$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2024_9_149_32.msi'
  checksum32    = '77f153a4ee286b9b90588c6961373ada80f4b67abca0ff74596f3b4884bb382e'
  url64         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2025_8_189.msi'
  checksum64    = '44b3d5b4011f4e505e5a34757f8e5f8ba5e877e465712a896eddbc4fb93fcbc9'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
