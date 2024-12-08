$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://downloadcenter.samsung.com/content/DR/202006/20200612081209671/Samsung_NVM_Express_Driver_3.3.exe'
  checksum      = 'D78C83C8D90CF666675E6E9D148BB3694F414B50458793F6DADDB85E5BF13B6B'
  checksumType  = 'sha256'

  silentArgs    = '/q'
  validExitCodes= @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
