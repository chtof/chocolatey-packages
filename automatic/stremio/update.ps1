import-module au

function global:au_GetLatest {
    $releases      = 'https://www.stremio.com/downloads'    
    $regex_version = 'https://dl.strem.io/stremio-shell-ng/v[\d\.]+/StremioSetup-v(?<Version>[\d\.]+)_x64.exe'
        
    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_version | Out-Null

    return @{ Version = $matches.Version ; URL32 = $url.href }
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