$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = 'Sublime Merge'
    url64          = 'https://download.sublimetext.com/sublime_merge_build_2083_x64_setup.exe'
    checksum64     = 'e07ca51bb910f301e12e593d273be2951dc930400e97901c6098a31d59be7355'
    checksumType   = 'sha256'
    silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

[array]$key = Get-UninstallRegistryKey @packageArgs

switch ($key.Count) {
    1 {
        $key | ForEach-Object {
            Install-BinFile -Name 'smerge' -Path (Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe')
        }
        break
    }
    0 {
        Write-Error "$env:ChocolateyPackageName installation failed, unable to detect uninstall registry key."
        Write-Warning "Please report this to the package maintainer."
        break
    }
    default {
        Write-Error "$env:ChocolateyPackageName installation failed, multiple ($($key.Count)) uninstall registry keys found."
        Write-Warning "Please inform the package maintainer that the following keys were matched:"
        $key | ForEach-Object {
            Write-Warning "- $($_.DisplayName): $($_.InstallLocation)"
        }
    }
}
