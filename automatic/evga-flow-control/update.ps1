import-module au

function global:au_GetLatest {
     $releases = 'https://www.evga.com/software/'
	 $regex   = 'EVGA_Flow_Control_Setup_v(?<Version>[\d\.]+).zip'

	 $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing  -Headers @{ "Accept-Encoding"="gzip, deflate, br" }
	 $url = $download_page.links | ? href -match $regex | select -Last 1

     return @{
        Version = $matches.Version
        URL32 = 'https://www.evga.com' + $url.href
    }
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