$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_4_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = '58ebad01d586c432410a40257f0105b4101184471f621ca154c7904a402d69dd74b39d1e43618551898227420e0a80c638c93f8b135ae08f2857e939ab7c1422'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_4_1.exe'
  checksumType64  = 'sha512'
  checksum64      = '5d897ecfd1687c23e5d7f0371d11939bc755274bf4ac7b4b4ed80e4582ee4d7b764b2944d136e8dfd86e300f025231a6cdbc408cb7e83c454eb46b07dc8bfa70'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
