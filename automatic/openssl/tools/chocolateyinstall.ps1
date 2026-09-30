$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-4_0_3.exe'  
  checksumType32  = 'sha512'
  checksum32      = '44f0839620f788962073e9e1038d1a23fc380b9d4c697ffb644c9f23471aad19e2b2010478463b85234adfba51542b49954853f8954fd6ef23ff12dfb31eb2e8'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-4_0_3.exe'
  checksumType64  = 'sha512'
  checksum64      = 'b694ea7116d1271461efcb0a764e6e85721553dae28c7f5e57b81c24032055539f0486b9be26f0cb44241bde6f87253501c0d4ebb361750f3c2286a22e1a32b9'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
