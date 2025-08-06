$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_5_2.exe'  
  checksumType32  = 'sha512'
  checksum32      = '4d9369fa9b65a73466fb946a38fbdbd8c46879ec623ed983d4c79b7fcb1eb35de2221d78e415187ed31985f2483ad14f44d1cb711b8d34c2e025755c0e7e41ff'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_5_2.exe'
  checksumType64  = 'sha512'
  checksum64      = '195f470651a00c34bb1a073ceca3fa1cbe3bc86f656bc8958da275fd3ab76a574a33fda1f66940199a4eaceb4a4918ce42175342db62c04ec746ba9db46d2d03'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
