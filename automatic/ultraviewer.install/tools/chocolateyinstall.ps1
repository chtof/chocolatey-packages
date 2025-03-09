$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe'
  checksum     = '169468ed8f7c755f834a7b2f95f077de5f0c94e79c9e1dcc63e9483616a9033a'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
