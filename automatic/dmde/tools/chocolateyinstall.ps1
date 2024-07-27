$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"  
  file32      = "$toolsDir\dmde-4-2-0-814-win32-gui.zip"
  file64      = "$toolsDir\dmde-4-2-0-814-win64-gui.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file32,$packageArgs.file64 -ErrorAction SilentlyContinue

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "DMDE.lnk"
$targetPath = Join-Path $toolsDir "dmde.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
