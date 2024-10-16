$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\CoolSoft_VirtualMIDISynth_2.13.9.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Path "$toolsDir\*.exe" -ErrorAction SilentlyContinue
