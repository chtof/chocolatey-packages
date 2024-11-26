$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://download.softros.com/SoftrosLANMessengerSetup.msi'
  checksum     = 'f4efd3b87df1ec7f39d365230f494f3185f8f24735ba377a1ca2e307a9fba696'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
