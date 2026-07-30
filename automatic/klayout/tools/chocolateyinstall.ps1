$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.10-win32-install.exe'
  checksum      = '220391607e77f06faf83a3a46411376ab53032003167db34491ee387077cb80e'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.10-win64-install.exe'
  checksum64    = '1e60c26e4d69104f0ffee0249cf64f16b0defe6aca2a168eb1d6bcc562a48366'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
