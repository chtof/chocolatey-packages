$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe'
  checksum     = 'c25e4de8b2eeaa259e67157fe6e21027eb78bef90e08a33ce5ff2a188a06e54e'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
