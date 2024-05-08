import-module au

function global:au_GetLatest {
    $releases       = 'https://chronoplexsoftware.com/myfamilytree/config.js'
    $download_url   = 'https://chronoplexsoftware.com/myfamilytree/downloads'
    $download_page = Invoke-WebRequest -Uri $releases     
    $regex   = 'var appVersionNumber = "(?<Version>.*)";'
    $regex_lp   = 'var applpVersionNumber = "(?<Version_lp>.*)";'
    $download_page -match $regex
    $version = $matches.Version
    $download_page -match $regex_lp
    $version_lp = $matches.Version_lp
    return @{ Version = $version ; URL32 = $download_url + "/myfamilytree_languagepack" + $version_lp + ".msi" ; URL64 = $download_url + "/myfamilytree_languagepack" + $version_lp + "x64.msi"}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }        
    }    
}

update -NoCheckUrl