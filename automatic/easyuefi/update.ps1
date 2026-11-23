import-module au

function global:au_GetLatest {
	$releases = 'https://www.easyuefi.com/index-us.html'
	$regex    = 'EasyUEFI_Trial.exe'
    $regexVersion = '"softwareVersion": "(?<Version>[\d\.]+)"'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.Content -match $regexVersion    
    $version = $matches.Version

	$url = $download_page.links | ? href -match $regex | select -Last 1
	
    return @{ Version = $version ; URL32 = 'https://www.easyuefi.com/' + $url.href }
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