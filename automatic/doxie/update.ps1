$ErrorActionPreference = 'Stop'
import-module au
. ..\..\helpers\semver_Helper.ps1

function global:au_GetLatest {
	$releases = Get-RedirectedUrl 'https://r.getdoxie.com/app/download_windows'    
	$regex    = 'DoxieSetup-(?<Version>[\d\._]+).exe'

    $releases -match $regex | Out-Null

    return @{ Version = semver($version) ; URL32 = $releases }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
