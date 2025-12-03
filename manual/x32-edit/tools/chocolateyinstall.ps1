$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://cdn.mediavalet.com/aunsw/musictribe/3vu8yRneAU6-aF0FD08DQg/K8yTgBRVKEWsp3m4Px8gCA/Original/X32-Edit_PC_4.4.zip'  
  checksum      = 'af32f032f21a1f84c7e51817bb708ea41d1481698ffc5ca49b7e46df202b1d68'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'X32 Edit.lnk'
$targetPath = Join-Path $toolsDir 'X32-Edit.exe'
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"