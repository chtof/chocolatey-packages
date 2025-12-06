import-module au

function global:au_GetLatest {
    $releases = 'https://www.spacedesk.net/download/'
    $regex    = 'msi version: (?<Version>[\d\.]+)(\</span\>|\</div\>)'

    $url = Get-RedirectedUrl https://spacedesk.net/downloadclient
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = $url 
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update