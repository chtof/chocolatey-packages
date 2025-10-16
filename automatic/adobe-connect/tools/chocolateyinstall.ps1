$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2024_9_149_32.msi'
  checksum32    = '77f153a4ee286b9b90588c6961373ada80f4b67abca0ff74596f3b4884bb382e'
  url64         = 'https://download.adobe.com/pub/connect/updaters/meeting/11_0/ConnectApp11_2025_9_15.msi'
  checksum64    = '64c3ced0e678b24a2bd405f60a875265b174863950239c0cba2aa837aa477f7c'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
