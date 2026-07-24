$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"  
  file64        = "$toolsDir\kid3-3.10.1-win32-x64.zip"  
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file64 -ErrorAction SilentlyContinue

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Kid3.lnk"
$targetPath = Join-Path $toolsDir "kid3-3.10.1-win32-x64\kid3.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
