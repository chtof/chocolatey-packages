$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  
  url64        = 'https://github.com//marktext/marktext/releases/download/v0.23.0/marktext-win-x64-0.23.0.zip' 
  checksum64   = '10ff69f91303f1009e7bdb1f490a4b30d716804ebc95b9e98c12b0c84cffa16f'

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
