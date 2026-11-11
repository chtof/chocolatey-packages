$ErrorActionPreference = 'Stop';

# Package versions up to 0.14.2 unzipped ActivityWatch into the package folder and
# added an all-users startup shortcut pointing there. Remove that shortcut so
# Windows no longer tries to start ActivityWatch from the old location.
$legacyShortcut = Join-Path ([Environment]::GetFolderPath('CommonStartup')) 'aw-qt.lnk'
if (Test-Path $legacyShortcut) {
  Remove-Item $legacyShortcut -Force -ErrorAction Continue
}

# The installer supports both scopes: all users when elevated, otherwise the current user.
$scope = if (Test-ProcessAdminRights) { '/ALLUSERS' } else { '/CURRENTUSER' }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.14.2/activitywatch-v0.14.2-windows-x86_64-setup.exe'
  checksum64     = '86f2cd3c8eb8df1da30706bddee677e2af541a943ae32fbdc7de09135485a054'
  checksumType64 = 'sha256'
  # The installer's Restart Manager closes any running ActivityWatch processes
  # that hold files it needs to replace.
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- $scope"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
