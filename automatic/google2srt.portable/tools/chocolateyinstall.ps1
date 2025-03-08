$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\Google2SRT-0.7.11.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Google2SRT.lnk"
$targetPath = Join-Path "$toolsDir" "Google2SRT-0.7.11\Google2SRT.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
