$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\eddie-ui_2.24.6_windows-10_x86_portable.exe"
  file64      = "$toolsDir\eddie-ui_2.24.6_windows-10_x64_installer.exe"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude Eddie-CLI.exe,Eddie-UI.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Eddie-UI.lnk"
$targetPath = Join-Path "$toolsDir" "eddie-ui_2.24.6_windows-10_x64_portable\Eddie-UI.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
