$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove previous setup
Remove-Item -Path "$toolsDir\*.exe" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  fileFullPath  = "$toolsDir\Log4OM2_2_35_1_0.zip"  
}
Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.fileFullPath

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\Log4OM2_2_35_1_0.exe"
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}
Install-ChocolateyInstallPackage @packageArgs

Write-Warning 'Users of Log4OM version 1 must export an ADIF file from version 1 and import it into version 2 once a database has been created in version 2 as described in Quick_Start_Guide.pdf.'
