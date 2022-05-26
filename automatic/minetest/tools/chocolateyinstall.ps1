$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation

# Keep previous versions as games and downloaded content are downloaded in folder of previous versions.

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsLocation"
  file          = "$toolsDir\minetest-5.5.1-win32.zip"
  file64        = "$toolsDir\minetest-5.5.1-win64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Minetest.lnk'
$targetPath = Join-Path "$toolsLocation" "minetest-5.5.1-win$(Get-OSArchitectureWidth)\bin\minetest.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath
