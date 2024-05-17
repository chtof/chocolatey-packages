$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://www.realpopup.it/files/RealPopupSetup.msi'
  checksum     = '3306de422aac8a99ed3acd9d696ceb787ed79b77a4ee5c2bb6a06a9906b6ec27'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
