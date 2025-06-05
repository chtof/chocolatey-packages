$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.easyuefi.com/downloads/EasyUEFI_Trial.exe'
  checksum      = '00b282b565157dd20dfb3c00f91cf4c90c33aca9f653eef814ab3c984aedd191'
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
