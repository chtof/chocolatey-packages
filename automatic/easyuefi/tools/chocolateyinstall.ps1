﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.easyuefi.com/downloads/EasyUEFI_Trial.exe'
  checksum      = '8db77961ee7ed967b439064c0840bf5639a43ea4eb9ccfacc2bacc6ddac97e73'
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
