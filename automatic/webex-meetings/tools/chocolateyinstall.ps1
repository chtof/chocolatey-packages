$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '97c3f1b19aebc041395d84dd8ddf2e5e57de092163d3f7ca5eafc2f8723fcf9e9cad5f15ae5d1fafdfaea5dfcdcc318628e74466027642ecda544ffdcf843ddf'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
