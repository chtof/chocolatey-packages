$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_5_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = '69d078dd7674f68e466854b7bbadf6fd8f1a6900b2dc2ca0bc8973748b4f31a7922a76856e7a4838d2c2d9d225a3587b2af72a6d9f5a8a9821dc9808fd25f552'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_5_0.exe'
  checksumType64  = 'sha512'
  checksum64      = '3bac2c161b4eb24664f3c5b19fa0c489eda174d5a89f79a347cd7722f70b290410a602c9ec1e306aa47730ad5569f370e6654b7d853da5432e3f4724d71032b3'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
