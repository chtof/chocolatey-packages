$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$OSArchitectureWidth = Get-OSArchitectureWidth

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Torrent File Editor.lnk"
$targetPath = Join-Path $toolsDir "torrent-file-editor-1.0.0-x${OSArchitectureWidth}.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
