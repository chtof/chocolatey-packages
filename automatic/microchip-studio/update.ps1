import-module au

function global:au_GetLatest {
    $releases = 'https://www.microchip.com/en-us/tools-resources/develop/microchip-studio'
    $regex    = 'as-installer-(?<Version>[\d\.]+)-full.exe'

    <#$ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match $regex | Out-Null #>

    $page = Invoke-WebRequest -UseBasicParsing -Uri "https://www.microchip.com/en-us/tools-resources/develop/microchip-studio" `
        -WebSession $session `
        -Headers @{
        "authority"="www.microchip.com"
          "method"="GET"
          "path"="/en-us/tools-resources/develop/microchip-studio"
          "scheme"="https"
          "accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8"
          "accept-encoding"="gzip, deflate, br, zstd"
          "accept-language"="fr-FR,fr;q=0.5"
          "cache-control"="max-age=0"
          "priority"="u=0, i"
          "referer"="https://www.google.com/"
          "sec-ch-ua"="`"Chromium`";v=`"146`", `"Not-A.Brand`";v=`"24`", `"Brave`";v=`"146`""
          "sec-ch-ua-mobile"="?0"
          "sec-ch-ua-platform"="`"Windows`""
          "sec-fetch-dest"="document"
          "sec-fetch-mode"="navigate"
          "sec-fetch-site"="cross-site"
          "sec-fetch-user"="?1"
          "sec-gpc"="1"
          "upgrade-insecure-requests"="1"
    }
    $page.links | ? href -match $regex


	$version = $matches.Version

    return @{
        Version = $version
        # https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/as-installer-7.0.2594-full.exe
        URL32   = 'http://studio.download.atmel.com/' + $version + '/as-installer-' + $version + '-full.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update