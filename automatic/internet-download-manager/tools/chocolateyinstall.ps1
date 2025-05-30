$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build40.exe'
  checksum      = 'f7694be6dde9b2d60c2fee25d44f6aa58757a16c5d45f8bbf4d7da217559a65f'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
