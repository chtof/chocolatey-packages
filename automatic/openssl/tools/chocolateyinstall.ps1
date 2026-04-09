$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_6_2.exe'  
  checksumType32  = 'sha512'
  checksum32      = '7387107bce216eb608b132031a38990c50ac811ef71bbc10d32879583e447f8fcbe858a7c28d2c41cc9eb10cdd3f506e11a19aea36933b1587b2b53a672cc404'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_6_2.exe'
  checksumType64  = 'sha512'
  checksum64      = 'bdeaf4e8e7dc50d48cb340b180cb279354a05b3f8448136e6d6cc2ae17477515299b9d4bc4a16e41edf2a786f25c7cae039067b39094095117285565d0040dfb'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
