$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe'
  checksum     = '020aac79a14717e316a593155ca778dd3e253b888bf62633b174838d35df7f41'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
