import-module au

function global:au_GetLatest {
    $releases = 'https://basilisk-browser.org/download.shtml'
    $regex32  = 'basilisk-(?<FullVersion32>[\d]+[\d]{6}).win32.installer.exe'
    $regex64  = 'basilisk-(?<FullVersion64>(?<Version>[\d]+)[\d]{6}).win64.installer.exe'
    
    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $url32 = $download_page |? href -match $regex32 | Select -Last 1
    $fullVersion32 = $matches.FullVersion32
    $url64 = $download_page |? href -match $regex64 | Select -Last 1
    $fullVersion64 = $matches.FullVersion64
    $version     = $matches.Version -replace '([\d]+)([\d]{2})([\d]{2})','$1.$2.$3'

    return @{
        Version = $version
        URL32   = $url32.href
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update