import-module au


function global:au_BeforeUpdate {    
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $releases = 'https://www.firestormviewer.org/windows'
    $regex32  = 'Phoenix-Firestorm-release-(?<Version>[\d-]+)_Setup.exe'
    $regex64  = 'Phoenix-Firestorm-releasex64-(?<Version>[\d-]+)_Setup.exe'

    #$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
    $session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
    $session.Cookies.Add((New-Object System.Net.Cookie("cf_clearance", "4BNcZFrMkSsR7plzQYUDiaRiUZ6aR9cZ0X0oAraWOj8-1705741119-1-AaGHlMmaJ2wirBUWNDUTJnD+Z+YZwVo0FieiTq0NEHQ+7QUa5uWmH54hmOYEWNBJ76exazqTImddNMN148HISxY=", "/", ".firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-necessary", "yes", "/", "www.firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-functional", "no", "/", "www.firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-performance", "no", "/", "www.firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-analytics", "no", "/", "www.firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-advertisement", "no", "/", "www.firestormviewer.org")))
    $session.Cookies.Add((New-Object System.Net.Cookie("cookielawinfo-checkbox-others", "no", "/", "www.firestormviewer.org")))
    Invoke-WebRequest -UseBasicParsing -Uri "https://www.firestormviewer.org/windows/" `
    -WebSession $session `
    -Headers @{
    "authority"="www.firestormviewer.org"
      "method"="GET"
      "path"="/windows/"
      "scheme"="https"
      "accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8"      
      "accept-language"="fr-FR,fr;q=0.8"
      "cache-control"="max-age=0"
      "referer"="https://www.firestormviewer.org/os/"
      "sec-ch-ua"="`"Not_A Brand`";v=`"8`", `"Chromium`";v=`"120`", `"Brave`";v=`"120`""
      "sec-ch-ua-mobile"="?0"
      "sec-ch-ua-platform"="`"Windows`""
      "sec-fetch-dest"="document"
      "sec-fetch-mode"="navigate"
      "sec-fetch-site"="same-origin"
      "sec-fetch-user"="?1"
      "sec-gpc"="1"
      "upgrade-insecure-requests"="1"
    }

    # https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Releasex64_AVX2-7-2-4-80712_Setup.exe
    $url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64

    return @{
        Version = ($matches.Version).Replace('-','.')
        URL32   = $url32.href
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"            = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"       = "`${1}'$($Latest.Checksum32)'"            
            "(^(\s)*url64\s*=\s*)('.*')"          = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum64)'"            
        }
    }
}

update -noCheckUrl -checksumFor none