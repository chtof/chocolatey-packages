$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# Remove zip files from previous versions
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName	   = $ENV:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  file           = Get-Item -path $toolsDir\*.zip

  url			       = 'https://www.pspad.com/files/pspad/pspad552en.zip'
  checksumType	 = 'sha256'
  checksum	   	 = '70d4d4d49f34938a32a679ae198c544adb687f9016858d454f4850bf61b9785a'

  url64          = 'https://www.pspad.com/files/pspad/pspad552en_x64.zip'
  checksumType64 = 'sha256'
  checksum64     = 'cdc91caaa1cdefd12691342a99e68866aa7fe38cab5c90a11a5ffb50020596aa'
}

# prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'phpCB.exe', 'TiDy.exe' ) {
  New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PSPad.lnk"
$targetPath = Join-Path $toolsDir "PSPad.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
