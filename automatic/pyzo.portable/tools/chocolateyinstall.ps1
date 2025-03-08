$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file32      = "$toolsDir\pyzo-4.19.0-win32.zip"
  file64      = "$toolsDir\pyzo-4.19.0-win64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Pyzo.lnk"
$targetPath = Join-Path $toolsDir "pyzo-4.19.0\pyzo.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
