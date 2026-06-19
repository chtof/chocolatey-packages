$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters
# CudaText needs to be installed in a directory where user has a write access.
if (!$pp['InstallationPath']) { $pp['InstallationPath'] = 'C:\CudaText' }

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = $pp['InstallationPath']  
  file        = "$toolsDir\cudatext-windows-i386-1.234.4.1.zip"
  file64      = "$toolsDir\cudatext-windows-amd64-1.234.4.1.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$myDocuments = [Environment]::GetFolderPath("MyDocuments")
$shortcutFilePath = Join-Path $programs "CudaText.lnk"
$targetPath = Join-Path $pp.InstallationPath "cudatext.exe"
Install-ChocolateyShortcut -WorkingDirectory "$myDocuments" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
