$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\OpenOrienteering-Mapper-0.9.6-Windows-x86.zip"
  file64      = "$toolsDir\OpenOrienteering-Mapper-0.9.6-Windows-x64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude mapper.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
if (Get-OSArchitectureWidth -compare 32) {
    $architectureWidth = 86
} else {
    $architectureWidth = 64
}
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "OpenOrienteering Mapper.lnk"
$targetPath = Join-Path $toolsDir "OpenOrienteering-Mapper-0.9.6-Windows-x${architectureWidth}\Mapper.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
