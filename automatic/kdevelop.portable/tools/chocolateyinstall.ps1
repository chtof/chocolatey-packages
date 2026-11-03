$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-7027-windows-cl-msvc2022-x86_64.7z'
  checksum64     = '8d60d9e77ef0e6a6a5007f9b25eab165d7395be61427e1eac432fccbce00c0d4'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
 
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
