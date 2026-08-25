$ErrorActionPreference = 'Stop';

$packageArgs = @{
  AppxPackageName = 'KeeperSecurityInc.KeeperPasswordManager'
  packageName     = $env:ChocolateyPackageName  

  url             = 'https://www.keepersecurity.com/desktop_electron/Win32/KeeperSetup32.msi'
  checksum        = '2c8246612677cdd1a3b72a371ac16769c631bfcf367b58b532695263d5e64a5d'
  checksumType    = 'sha256'  

  url64           = 'https://www.keepersecurity.com/desktop_electron/packages/KeeperPasswordManager.msixbundle'
  checksum64      = '056056283fb7ea65af3cee8771fb58b2249cf11040db543331779b1128477a2e'
  checksumType64  = 'sha256'  

  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

If (Get-OSArchitectureWidth -eq 64){
  # 64 bits
  #The .msixbundle format is not supported on Windows 10 version 1709 and 1803. https://docs.microsoft.com/en-us/windows/msix/msix-1709-and-1803-support
  $IsCorrectBuild=[Environment]::OSVersion.Version.Build
  If ($IsCorrectBuild -lt "18362") {
    Throw "This package requires at least Windows 10 version 1903/OS build 18362.x."
  }

  [version]$AppxVer = (Get-AppxPackage -name "$packageArgs.AppxPackageName").Version

  If ($AppxVer -gt [version]$version) {
    # you can't install an older version of an installed appx package, you'd need to remove it first
    Write-Warning "The installed $version version is newer than this package version, it may have autoupdated on your current OS..."
    } ElseIf ($AppxVer -Match [version]$version) {
      If($env:ChocolateyForce) {
        # you can't install the same version of an appx package, you need to remove it first
        Write-Host Removing already installed version first.
        Get-AppxPackage -Name $packageArgs.AppxPackageName | Remove-AppxPackage
      } else {
        Write-Host The $version version of KeeperPasswordManager is already installed. If you want to reinstall use --force
        return
      }
  }

  Add-AppPackage -Path $packageArgs.url64
} Else {
  # 32 bits
  Install-ChocolateyPackage @packageArgs
  # Install start menu shortcut
  $programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
  $target = "$env:LOCALAPPDATA\keeperpasswordmanager"
  $shortcutFilePath = Join-Path $programs "Keeper.lnk"
  $targetPath = Join-Path $target "keeperpasswordmanager.exe"
  Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
}

