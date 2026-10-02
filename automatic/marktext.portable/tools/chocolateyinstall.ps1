$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  
  url64        = 'https://github.com//marktext/marktext/releases/download/v0.20.0/marktext-win-x64-0.20.0.zip' 
  checksum64   = 'fa6103a0076ec2c91ff519d3a19e64ae6be3a8ecb1b94c241021f38699676746'

  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" 'Mark Text.lnk'
$targetPath = Join-Path "$toolsDir" 'Mark Text.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
