$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build36.exe'
  checksum      = 'd77e44e2557a31329bd29278b4c6c91cfc0b8f2b184a292525eff6e9d1ec8e58'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
