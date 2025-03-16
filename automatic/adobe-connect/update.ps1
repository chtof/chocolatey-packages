$ErrorActionPreference = 'Stop'
Import-Module au

function global:au_BeforeUpdate {    
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
	$releases      = 'https://helpx.adobe.com/fr/adobe-connect/connect-downloads-updates.html'	
    $regex_version = 'v(?<Version>[\d\.]+)'
    $regex_url32     = 'https://www.adobe.com/(.*)?go/(?<url_suffix32>Connect(\d+)_32msi)'
    $regex_url64     = 'https://www.adobe.com/(.*)?go/(?<url_suffix64>Connect(\d+)msi)'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -Headers @{"authority"="helpx.adobe.com" ;"method"="GET"; "path"="/fr/adobe-connect/connect-downloads-updates.html"  ;"accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8";"accept-encoding"="gzip, deflate, br, zstd"; "scheme"="https" ; "referer"="https://helpx.adobe.com/in/adobe-connect/connect-downloads-updates.html";"sec-ch-ua"="`"Not(A:Brand`";v=`"99`", `"Brave`";v=`"133`", `"Chromium`";v=`"133`"";"sec-fetch-site"="same-origin";"sec-ch-ua-platform"="`"Windows`""}

    $download_page -match "$regex_version.64" | Out-Null
    $version = $matches.Version -Replace '_','.'

    ($download_page.links | ? href -match $regex_url32).href | Out-Null
    $url_suffix32 = $matches.url_suffix32
    ($download_page.links | ? href -match $regex_url64).href | Out-Null
    $url_suffix64 = $matches.url_suffix64    

    return @{
        Version = $version
        URL32   = 'https://www.adobe.com/go/' + $url_suffix32
        URL64   = 'https://www.adobe.com/go/' + $url_suffix64
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url32\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -NoCheckUrl -ChecksumFor None
