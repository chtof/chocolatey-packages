$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2024_9_149_32.msi'
  checksum32    = '77f153a4ee286b9b90588c6961373ada80f4b67abca0ff74596f3b4884bb382e'
  url64         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2024_11_71.msi'
  checksum64    = '56c2d4aa211e333d6ba23f2843094da4d10d928f7a9ceb01baf1f1229c298b99'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
