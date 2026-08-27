$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\eddie-ui_2.26.2_windows-10_x86_installer.exe"
  file64      = "$toolsDir\eddie-ui_2.26.2_windows-10_x64_installer.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
