$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases     = 'https://www.ne.jp/asahi/foresth/home/'
	$regexVersion = '(?<Version>[\d\._]+)'
    $regex        = 'savi([\d\._]+).zip'
 
	$download_page = Invoke-WebRequest -Uri $releases
	$url = $download_page.links | ? href -match $regex | select -Last 1

	$download_page.links | ? href -match $regex | Select -First 1 | Out-Null   
	$download_page.ParsedHtml.querySelector('body > table > tbody > tr > td li > div > strong > a[name="savi"]').nextSibling.nodeValue.Trim() -match $regexVersion | Out-Null

    return @{ Version = $matches.Version ; URL32 = $releases + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
