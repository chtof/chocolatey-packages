$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file     = 'GeoGebraGraphing-Windows-Installer-6-0-840-0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  filefullpath  = "$toolsDir\$file"
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GeoGebra Graphing Calculator.lnk"
$targetPath = Join-Path $toolsDir $file
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
