$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20260123012755.win32.installer.exe'
  checksum       = '2bd0eb23d1f3926ca33298fd1297ecec948e0ec500febfcb0eff93bb0af35520'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20260123020224.win64.installer.exe'
  checksum64     = 'd2e7454dedc4c03649af201bd37a8cc6622e516400b6a00ee208e5436654ab95'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
