$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_3_2.exe'  
  checksumType32  = 'sha512'
  checksum32      = '23cdd063ea07a9c67c1cc6acdc13d7ec221da9fa190a2aa1e9bed299078293312ba76e4d97ebede185cd7fa6bad418feba3fcc5b796a56c09ae811fea82c652d'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_3_2.exe'
  checksumType64  = 'sha512'
  checksum64      = '1a70d647534d29a8cc7e28925ca3dda7207fb9e279040087621ca6b65a1baba8d3a284ad14799bd107e658f70bbfa4ef0c008f51e1db95ba9d6470a1903ef90c'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
