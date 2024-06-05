$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_3_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = '735cdad23b77deac355b68d5b593e8ba5b2f3d087e7eee9964969f521235afcef85887ab5c6c908e0e927e6f957b6cc9cf6fed4c172bb2890825138f4f07ae07'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_3_1.exe'
  checksumType64  = 'sha512'
  checksum64      = '27093939495ccf10a24399141d6cbb4a8f9a09054ad53238d569d73bae46f983ce2151c97a138133490dc389143be62c7df82086937e4a8ab7e21778fa8ffdbb'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
