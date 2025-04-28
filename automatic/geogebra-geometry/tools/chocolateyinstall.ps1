$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file     = 'GeoGebraGeometry-Windows-Installer-6-0-884-1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  filefullpath  = "$toolsDir\$file"
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GeoGebra Geometry.lnk"
$targetPath = Join-Path $toolsDir $file
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
