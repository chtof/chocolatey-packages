$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Remove-Item -Path "$toolsDir\*.exe" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Log4OM2_2_36_1_0_portable.zip"                                          
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file
    
# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs 'Log4OM 2.lnk'
$targetPath       = Join-Path $toolsDir 'portable\L4ONG.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs 'Log4OM NG Config Manager.lnk'
$targetPath       = Join-Path $toolsDir 'Portable\L4ONG.ConfigManager.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning 'Users of Log4OM version 1 must export an ADIF file from version 1 and import it into version 2 once a database has been created in version 2 as described in Quick_Start_Guide.pdf.'
