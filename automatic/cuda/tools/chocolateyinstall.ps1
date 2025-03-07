$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda_12.8.1_572.61_windows.exe'
  checksum     = '19392bbffd0ad4ee7cb295a181e87f682187f17653679c1c548c263b7e1cd9a6'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Skipping installation because Cuda supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

Install-ChocolateyPackage @packageArgs
