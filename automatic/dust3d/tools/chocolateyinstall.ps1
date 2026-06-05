$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\dust3d-1.1.3.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

$packageArgsSubFolder = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"
  fileFullPath = (Get-ChildItem -Recurse -Filter '*.zip' $toolsDir).FullName
}

Get-ChocolateyUnzip @packageArgsSubFolder
Remove-Item -Path $packageArgsSubFolder.fileFullPath

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Dust3D.lnk'
$targetPath = Join-Path "$toolsDir" 'dust3d.exe'
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
