$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_5_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = '0bbce330f2a9469eda1b554aafcc359f092c513db90ee1450f98b0a1d0a23e9810b1fee660b402842ad735df8ec7f45f1ca06e6c0296bfde1faf25de7352656e'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_5_1.exe'
  checksumType64  = 'sha512'
  checksum64      = '86ded14fe9947a29b67de1c48a13b98d968d6b810253ffc71b2334ec09d245b571da4b6f82e77aeae53db9a92239963bfb857a272db725c7f45629dd9c8c61bb'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
