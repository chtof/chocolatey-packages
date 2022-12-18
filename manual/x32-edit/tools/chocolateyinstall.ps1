$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://mediadl.musictribe.com/download/software/behringer/X32/X32-Edit_PC_4.3.zip'
  checksum      = '82108C184C90B32EF9EC22E809E39AFE2E479710F2594290FB9404AEA549C614'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'X32 Edit.lnk'
$targetPath = Join-Path $toolsDir 'X32-Edit.exe'
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"