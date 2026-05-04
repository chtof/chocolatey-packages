$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url            = 'https://github.com/oschwartz10612/poppler-windows/releases/download/v26.02.0-0/Release-26.02.0-0.zip'
$checksum       = '993e4a94376ed712fafc7058d724ea0b943d118bbd2305cd9ed55174eb85cda5'
$checksumType   = 'sha256'

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  Url64bit        = $url
  Checksum64      = $checksum
  ChecksumType64  = $checksumType
}
Install-ChocolateyZipPackage @packageArgs
