$ErrorActionPreference = 'Stop';
$toolsDir =	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

### PARAMETERS
If ($PackageParameters.InstallDir) {
  $installDir = $PackageParameters.InstallDir
} Else {
  $installDir = "$toolsDir"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$installDir"
  # url            = 'https://github.com/mifi/lossless-cut/releases/download/v3.43.0/LosslessCut-win.zip'
  url64          = 'https://github.com//mifi/lossless-cut/releases/download/v3.64.0/LosslessCut-win-x64.7z'
  # checksum       = 'c5df41dac8d792215e75663f29be7c14410ef7e115bb2648ed5d4214aa7f00ec'
  checksum64     = '158ae74e26790134fe634f3371e2081db54cfffe41836a33204c82e54c66227a'
  checksumType   = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude LosslessCut.exe
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

$targetPath = Join-Path "$installDir" "LosslessCut.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
  $programsFilePath = Join-Path "$programsPath" "LosslessCut.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
  $programsFilePath = Join-Path "$programsPath" "LosslessCut.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

# Add SendTo shortcut
If (-Not( $PackageParameters.NoSendToShortcut )) {
  $programsPath = "$env:APPDATA\Microsoft\Windows\SendTo\"
  $programsFilePath = Join-Path "$programsPath" "Merge media in LosslessCut.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

<#
# Set File Association
If (-Not( $PackageParameters.DontRegisterApp )) {
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\DefaultIcon") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\DefaultIcon" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities\FileAssociations") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities\FileAssociations" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut\command") -ne $true) { New-Item "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut\command" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut\command") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut\command" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes" -Force -ea SilentlyContinue };
	if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\RegisteredApplications") -ne $true) { New-Item "HKLM:\SOFTWARE\RegisteredApplications" -Force -ea SilentlyContinue };
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities" -Name "Hidden" -Value "0" -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities" -Name "ApplicationName" -Value "LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities" -Name "ApplicationDescription" -Value "LosslessCut is an editing tool that lets you cut or trim your videos or audios." -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities" -Name "ApplicationIcon" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\DefaultIcon" -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell" -Name "(default)" -Value "losslesscut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut" -Name "(default)" -Value "Cut media in LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut" -Name "Icon" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\shell\losslesscut\command" -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe" -Name "(default)" -Value "LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon" -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell" -Name "(default)" -Value "losslesscut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut" -Name "(default)" -Value "Cut media in LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut" -Name "Icon" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\losslesscut\command" -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\RegisteredApplications" -Name "LosslessCut" -Value "SOFTWARE\Clients\Media\LosslessCut\Capabilities" -PropertyType String -Force -ea SilentlyContinue;
	$extensions = @("3g2","3gp","8svx","aa","aac","aax","act","aiff","alac","amr","amv","ape","asf","au","avi","awb","cda","dct","drc","dss","dvf","f4a","f4b","f4p","f4v","flac","flv","gif","gifv","gsm","iklax","ivs","m2ts","m2v","m4a","m4b","m4p","m4v","mkv","mmf","mng","mogg","mov","mp2","mp3","mp4","mpc","mpe","mpeg","mpg","mpv","msv","mts","mxf","nmf","nsf","nsv","oga","ogg","ogv","opus","qt","ra","rf64","rm","rmvb","roq","sln","svi","ts","tta","vob","voc","vox","wav","webm","wma","wmv","wv","yuv","tsv","3gpp","webm")
	foreach ($extension in $extensions) {
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\.$extension")) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\." + "$extension".ToUpper().ToUpper()) -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\.$extension\OpenWithList") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\.$extension\OpenWithList" -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\.$extension\OpenWithList\LosslessCut.exe") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\.$extension\OpenWithList\LosslessCut.exe" -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\.$extension\OpenWithProgids") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\.$extension\OpenWithProgids" -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper())) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper().ToUpper()) -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\DefaultIcon")) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\DefaultIcon") -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell")) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell") -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut")) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut") -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut\command")) -ne $true) { New-Item ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut\command") -Force -ea SilentlyContinue };  
		if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut" -Force -ea SilentlyContinue };
		if ((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut\command") -ne $true) { New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut\command" -Force -ea SilentlyContinue };
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\.$extension\OpenWithProgids" -Name ("LosslessCut." + "$extension".ToUpper()) -Value "" -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper()) -Name "(default)" -Value ("$extension".ToUpper() + " Media File") -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\DefaultIcon") -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell") -Name "(default)" -Value "losslesscut" -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut") -Name "(default)" -Value "Cut media in LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut") -Name "Icon" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath ("HKLM:\SOFTWARE\Classes\LossLessCut." + "$extension".ToUpper() + "\shell\losslesscut\command") -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;  
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut" -Name "(default)" -Value "Cut media in LosslessCut" -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut" -Name "Icon" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.$extension\Shell\losslesscut\command" -Name "(default)" -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes" -Name ".$extension" -Value "" -PropertyType String -Force -ea SilentlyContinue;
		New-ItemProperty -LiteralPath "HKLM:\SOFTWARE\Clients\Media\LosslessCut\Capabilities\FileAssociations" -Name ".$extension" -Value ("LosslessCut." + "$extension".ToUpper()) -PropertyType String -Force -ea SilentlyContinue;
	}
}
#>
