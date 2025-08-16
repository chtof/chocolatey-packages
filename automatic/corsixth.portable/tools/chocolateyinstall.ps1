$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\CorsixTH-0.69.1-windows-x86_64.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "CorsixTH.lnk"
$targetPath = Join-Path $toolsDir "corsixTH\corsixTH.exe"
Install-ChocolateyShortcut -WorkingDirectory "$toolsDir\corsixTH" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
