$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"  
  file64      = "$toolsDir\FFBatch_AV_Converter_Portable_3.0.1_64bit.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
Stop-Process -Name FFBatch
Remove-Item "$toolsDir\FFbatch_AV_Converter_Portable_.*bit.exe" | Out-Null

Write-Warning "ffmpeg-batch.portable is installed in ${env:USERPROFILE}\Documents\FFmpeg Batch AV Converter"
<#
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare '64') { $arch = '_x64' } else { $arch = '' }

$shortcutFilePath = Join-Path "$programs" 'FFmpeg Batch Portable.lnk'
$targetPath = Join-Path "$toolsDir" "FFmpeg_Batch_2.5.4_Portable${arch}.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
#>
