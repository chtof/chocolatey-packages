$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$programs   = [environment]::GetFolderPath([environment+specialfolder]::Programs)

# Remove folder(s) from previous versions
ForEach ($arch in "32 64") {
  $dir = Join-Path $toolsDir "die_win${arch}_portable"
  If (Test-Path $dir) { Remove-Item -Recurse -Path $dir -ea 0 }
}

# Remove old shortcut for diel.exe (to keep for users who upgrade from die 2.x versions)
$shortcutFilePath = Join-Path $programs 'Detect It Easy Lite.lnk'
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath -ea 0 }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\die_win32_portable_3.10_x86.zip"
  file64        = "$toolsDir\die_win64_portable_3.10_x64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path "$toolsDir\*.zip"

# Install start menu shortcut
$targetPath = [System.IO.Path]::Combine("$toolsDir", 'die.exe')
$shortcutFilePath = Join-Path $programs 'Detect It Easy.lnk'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
