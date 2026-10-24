$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-4_1_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = 'f2ca279f87320d515babbfdd32694130904badbae276368ba7b2c9ede7f473095a2d003a2fd34b5a857214b271967bc10632ec24ea72e8398839c9d402a61687'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-4_1_0.exe'
  checksumType64  = 'sha512'
  checksum64      = '38199f24d65f32b5f89212a1bb5ccb268603e5cca12bb03aebd7ab920a7e6acef0da2ccc814663c971338bce2c34b096f1e20f181651acf0edf39a8203bc2f1d'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
