$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-6891-windows-cl-msvc2022-x86_64.7z'
  checksum64     = '2aa0a6ff778e6c9896d492a471f2cba1edffccb362c5515773bf4ed2a559dbbd'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
 
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
