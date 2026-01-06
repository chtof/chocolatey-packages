$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = '057ade8e5cf2db93c4cef92ed79a0533c7aad5aa93feeeb3952ec6af90b1b67a'
  checksumType  = 'sha256'

  url64         = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = '66a2b494ee62a63686599ac5ed82514c5b20ad9fecd5e62e1065e63d83348b0e'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
