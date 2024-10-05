$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.13.2/activitywatch-v0.13.2-windows-x86_64.zip'
  checksum      = 'a067fa765678a411991826c4da811fd2d8ca260c2db9d6d897957565b61c369f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install in startup menu
$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
Install-ChocolateyShortcut -ShortcutFilePath "$commonStartupDir\aw-qt.lnk" -TargetPath "$toolsDir\activitywatch\aw-qt.exe"
