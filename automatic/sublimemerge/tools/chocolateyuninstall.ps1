$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'smerge'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = 'Sublime Merge'
    fileType       = 'exe'
    silentArgs     = '/SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /TASKS="contextentry"'
    validExitCodes = @(0)
}

[array]$key = Get-UninstallRegistryKey @packageArgs

switch ($key.Count) {
    1 {
        $key | ForEach-Object {
            $packageArgs.file = $_.UninstallString.toString()
            Uninstall-ChocolateyPackage @packageArgs
        }
        break
    }
    0 {
        Write-Warning "$env:ChocolateyPackageName has already been uninstalled by other means."
        break
    }
    default {
        Write-Warning "$($key.Count) matches found!"
        Write-Warning "Please alert package maintainer the following keys were matched:"
        $key | ForEach-Object {
            Write-Warning "- $($_.DisplayName): $($_.InstallLocation)"
        }
    }
}
