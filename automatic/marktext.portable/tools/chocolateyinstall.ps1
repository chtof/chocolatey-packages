$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  
  url64        = 'https://github.com//marktext/marktext/releases/download/v0.19.1/marktext-win-x64-0.19.1.zip' 
  checksum64   = '51110b1e1fa09badb0cbc1705f9c8f0a383d28d25f7fb5feab5b52dc261ed046'

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
