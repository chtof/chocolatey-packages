$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build49.exe'
  checksum      = '0d64ea392b6dbe537e63ab36fe0cc3da598c2a0677ffb1eeb2a171f03e77eff3'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
