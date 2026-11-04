$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/13.5.0/local_installers/cuda_13.5.0_windows_x86_64.exe'
  checksum     = '7788a8581fe50ff29e9df507c44a2a9d1ae3b6b0fe2de3c7e4d8fa3c2d12f292'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Skipping installation because Cuda supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

Install-ChocolateyPackage @packageArgs
