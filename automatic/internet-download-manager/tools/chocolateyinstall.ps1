$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman643build11.exe'
  checksum      = '87254f35dd11786f7ae0a8dc15e211f25cf64754e5fb02f279bcd2cd57bb0e5b'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
