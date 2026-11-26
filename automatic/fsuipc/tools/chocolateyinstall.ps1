$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsdir"
  fileFullPath = "$toolsDir\Install_FSUIPC7.zip"  
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.fileFullPath

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file64		= (Get-ChildItem -Recurse -Filter "Install_FSUIPC*.exe" $toolsDir).fullname   
  silentArgs    = '/S'
}

Install-ChocolateyInstallPackage @packageArgs