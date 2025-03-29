$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\poppler-25.03.0.tar.xz"  
}
Get-ChocolateyUnzip @packageArgs

$packageArgs_tar = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\poppler-25.03.0.tar.xz" -Replace (".xz$","")  # tar file
}
Get-ChocolateyUnzip @packageArgs_tar

Remove-Item $packageArgs.file64
Remove-Item $packageArgs_tar.file64
