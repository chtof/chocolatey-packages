$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build35.exe'
  checksum      = '2df14e8fb7c199cb084a59052ba62f5fa03eed2ebaa91dce63fb3992f02dc324'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
