$ErrorActionPreference = 'Stop'
$checksum = '50ae45c041383bbe61d2dbf41433d3d4007b963cfb640bc5f08dba3501f39c79'
$url = 'https://cisco.webex.com/client/WBXclient-40.2.12-18/webexapp.msi'

$packageArgs = @{
  packageName    = 'webex-meetings'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'webex-meetings*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
