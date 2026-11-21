$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'https://www.screenpresso.com/api/v1/latest'
    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content
    $json = $download_page | ConvertFrom-Json

    return @{
        Version = $json.stable.version
        URL32   = $json.stable.downloadUrlMsi
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update