import-module au

function global:au_GetLatest {
    $releases = 'https://basilisk-browser.org/download.shtml'
    $regex32  = 'https://.*/basilisk-(?<FullVersion32>[\d]+[\d]{6}).win32.installer.exe'
    $regex64  = 'https://.*/basilisk-(?<FullVersion64>(?<Version>[\d]+)[\d]{6}).win64.installer.exe'    
    
    #$download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #$url32 = $download_page |? href -match $regex32 | Select -Last 1
    $download_page.Content -match $regex32 | Out-Null
    $fullVersion32 = $matches.FullVersion32
    $url32 = $matches.0

    #$url64 = $download_page |? href -match $regex64 | Select -Last 1
    $download_page.Content -match $regex64 |Out-Null
    $fullVersion64 = $matches.FullVersion64
    $url64 = $matches.0

    $version     = $matches.Version -replace '([\d]+)([\d]{2})([\d]{2})','$1.$2.$3'

    return @{
        Version = $version
        URL32   = $url32
        URL64   = $url64
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}