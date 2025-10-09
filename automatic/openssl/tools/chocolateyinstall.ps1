$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_6_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = '66f57dcee6bf76534a422ba7fde292488288eef30296a2e02b0da51f07a709fab393f9cc3c402418d05cd17dc81ed1c46b79e08ccd6d2698bd788bf73bb02070'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_6_0.exe'
  checksumType64  = 'sha512'
  checksum64      = 'f588243a267edf6fb2ab5d93015ac819c36f1db6e048a8cc07f5908ac519845c540dec73b27e009894793a507a9d115933899020f1568f7e94135f6b0add2a27'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
