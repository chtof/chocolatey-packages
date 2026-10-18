$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  
  url64        = 'https://github.com//marktext/marktext/releases/download/v0.22.0/marktext-win-x64-0.22.0.zip' 
  checksum64   = '00b42855217653f879543b725a111e661f4493d40d2d3315412c1950f1c6b5bf'

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
