import-module au

function global:au_GetLatest {    
    $releases = "https://altcopy.net/#download"
    $regex32   = "/Alt-C_Setup_(?<Version>[\d\.]+)\.exe$" 
    $url = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match $regex32).href
    
    return @{
        Version = $matches.Version
        URL32   = $url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update