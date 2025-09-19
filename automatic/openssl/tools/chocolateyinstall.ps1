$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_5_3.exe'  
  checksumType32  = 'sha512'
  checksum32      = '1cc75ed539b3a10ddf518adb0fbcaba5e20233ade4e5850b96890f6bf97f059db18685ca0aa3aa4da20fe7e9bcbd325ef82be4e0f03fe119a5e6c7f94dd660c8'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_5_3.exe'
  checksumType64  = 'sha512'
  checksum64      = 'efadfa5fbe3ce94848313aeb2469af9b1ecfb3feb6ed3f368a1b8b22a75763ec96272ad3b9ce7117a3f608602afb04c8fc32ec48287844767396dcd5d3ea8e1c'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
