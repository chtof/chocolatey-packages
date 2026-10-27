$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = '08622a814f4b6b9ed34028be988917e3c29559db785f5756f2460f9ebf7b6198'
  checksumType  = 'sha256'

  url64         = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = 'bc25141333a9e468612fb6091d8cf807d890743cf3ce22f77ab600ecd01511ca'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
