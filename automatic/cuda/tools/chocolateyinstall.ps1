$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/12.8.0/local_installers/cuda_12.8.0_571.96_windows.exe'
  checksum     = '540522788653606ace80869b65ac3acf8a13bea40545bd2f2af69393b5025a80'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Skipping installation because Cuda supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

Install-ChocolateyPackage @packageArgs
