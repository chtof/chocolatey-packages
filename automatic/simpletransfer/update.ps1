import-module au

function global:au_GetLatest {
	$releases = 'https://rambax.com/simpletransfer/download'
	$regex    = 'SimpleTransfer(%20)?Desktop(%20)?Setup(%20)?(?<Version>[\d\.]+).exe'    
	
    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
	#$download_page.Content -match $regex | Out-Null
	
    return @{ Version = $matches.Version ; URL32 = 'https://rambax.com' + $url.href }
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