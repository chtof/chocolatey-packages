$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file64        = "$toolsDir\GitExtensions-Portable-x64-5.2.1.18061-0d74cfdc3.zip"
}

# Prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'ConEmu.exe', 'ConEmu64.exe', 'ConEmuc.exe', 'ConEmuc64.exe') {
  New-Item -path $toolsDir\GitExtensions\ConEmu -name "$file.ignore" -type File -force | Out-Null
}
foreach ( $file in 'pageant.exe', 'plink.exe', 'puttygen.exe' ) {
  New-Item -path $toolsDir\GitExtensions\PuTTY -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Git Extensions.lnk"
$targetPath = Join-Path $toolsDir "GitExtensions\GitExtensions.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
