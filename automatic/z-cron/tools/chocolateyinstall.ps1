$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://www.z-download.de/down/zcron.zip'

  checksum      = '38d576cfd86ebcaa6951ddaafe8c8e8a773a52520af9a2dbc953c53d69c0a2ed'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'

  file          = "$toolsDir\zcron.exe"
  softwareName  = 'Z-Cron'
  
  silentArgs	= '/Silent /Languageid 1033'
}

Install-ChocolateyInstallPackage @packageArgs

# Close z-cron due to the automatic startup after installation
Get-Process 'z-cron' | Stop-Process
