$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '29b3b78f254c66a3e2474a703c7e72d492fadcc449222a35b74511aeec0062b7b753f36c1dae72276ea10f3eb1bb6d792f36164332aef73a5ebbd10d62b48416'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
