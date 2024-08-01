$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.5-win32-install.exe'
  checksum      = '2d7074d136c60d4b77f8225d3aaa6b804202c2a4ec2faeff46b429bed2822f98'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.5-win64-install.exe'
  checksum64    = '18f417f04f7cc907b5d9fbad0f91b556d6c2608136d0aecbf3331d894a077171'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
