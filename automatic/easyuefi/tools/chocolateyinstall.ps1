﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.easyuefi.com/downloads/EasyUEFI_Trial.exe'
  checksum      = '5c2d0f7dbbeb8ce9b289a88329021032713f341ac1219a9ab635f4d393ad5569'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

# Note: Installation does not work with Windows 2012 R2
If ( [environment]::OSVersion.Version.Major -lt 10 ) {
  Write-Warning 'Skipping installation because EasyUEFI supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

# Note: EasyUEFI can only be installed on (U)EFI-based Windows operating system.
If ($env:Firmware_Type -ne "UEFI") {
  Write-Warning 'EasyUEFI can only be installed on (U)EFI-based Windows operating system.'
  return
}

Install-ChocolateyPackage @packageArgs
