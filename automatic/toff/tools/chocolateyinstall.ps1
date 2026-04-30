$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  file         =  'toff.exe'

  url           = 'https://dennisbabkin.com/php/downloads/TOff.zip'
  checksum      = 'A434E34AFA876DF9403C5EAFB0364E3674406EAA015C3A0C4F46A754F1B091FF'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "TOff.lnk"
$targetPath = Join-Path $toolsDir "toff.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
