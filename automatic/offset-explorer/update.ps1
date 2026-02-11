import-module au

function global:au_GetLatest {
    $releases = 'http://www.kafkatool.com/download.html'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex_version = "Offset Explorer (?<Version>[\d\.]+)<"
    $download_page.RawContent -match $regex_version | Out-Null
    $version = $matches.Version

    $regex32  = 'offsetexplorer.exe$'
    $url32    = $download_page.links | ? href -match $regex32 | select -Last 1
    $regex64  = 'offsetexplorer_64bit.exe$'
    $url64    = $download_page.links | ? href -match $regex64 | select -Last 1

    return @{
        Version = $version
        URL32   = 'http://www.kafkatool.com' + $url32.href
        URL64   = 'http://www.kafkatool.com' + $url64.href
     }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update