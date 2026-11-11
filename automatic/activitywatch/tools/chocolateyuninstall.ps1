$ErrorActionPreference = 'Stop';

# Startup shortcut created by package versions up to 0.14.2.
$legacyShortcut = Join-Path ([Environment]::GetFolderPath('CommonStartup')) 'aw-qt.lnk'
if (Test-Path $legacyShortcut) {
  Remove-Item $legacyShortcut -Force -ErrorAction Continue
}

[array]$keys = Get-UninstallRegistryKey -SoftwareName 'ActivityWatch'

if ($keys.Count -eq 1) {
  $key = $keys[0]

  # Unlike Setup, the Inno Setup uninstaller does not use Restart Manager to close
  # running applications, and aw-qt starts aw-server and the watchers as separate
  # processes. Stop every aw-* process running from the install folder so none of
  # its files are left behind locked. Matching on the path leaves any aw-* program
  # installed elsewhere alone.
  if ($key.InstallLocation) {
    $installDir = $key.InstallLocation.TrimEnd('\') + '\'
    Get-Process aw-* -ErrorAction SilentlyContinue |
      Where-Object { $_.Path -and $_.Path.StartsWith($installDir, [StringComparison]::OrdinalIgnoreCase) } |
      Stop-Process -Force -PassThru |
      Wait-Process -Timeout 10 -ErrorAction SilentlyContinue
  }

  $packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    file           = ($key.UninstallString -replace '"', '')
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    validExitCodes = @(0)
  }
  Uninstall-ChocolateyPackage @packageArgs
} elseif ($keys.Count -eq 0) {
  Write-Warning "$env:ChocolateyPackageName has already been uninstalled by other means."
} else {
  Write-Warning "$($keys.Count) matches found for ActivityWatch; to prevent accidental data loss, none will be removed."
  $keys | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
