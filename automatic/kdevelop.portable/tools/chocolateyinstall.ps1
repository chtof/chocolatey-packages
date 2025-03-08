$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "kdevelop.portable"
  destination   = "$toolsDir"  
  file64        = "$toolsDir\kdevelop-5.1.2-x64-portable.7z"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath