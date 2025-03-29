$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build31.exe'
  checksum      = '76575db4a0f5c391e4e69c38a2ac64c0c0f2a0fe406bd40e316155914e1ef4c3'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
