$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\OpenOrienteering-Mapper-0.9.6-Windows-x86.exe"
  file64      = "$toolsDir\OpenOrienteering-Mapper-0.9.6-Windows-x64.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
