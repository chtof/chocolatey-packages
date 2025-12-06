$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build57.exe'
  checksum      = '80cc4daf7816ad48a6d47852ed4dbab1c34d82e079937ae6544a7b223a65ecf7'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
