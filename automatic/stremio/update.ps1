import-module au

function global:au_GetLatest {
    $releases      = 'https://www.stremio.com/downloads'    
    $regex_version = 'https://dl.strem.io/stremio-shell-ng/v[\d\.]+/StremioSetup-v(?<Version>[\d\.]+)_x64.exe'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_version

    return @{
        Version = $matches.Version
        URL64 = $url.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor 64