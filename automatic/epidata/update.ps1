$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'http://www.epidata.dk/download.php'
	$regex    = 'all-in-one?.?(-setup\.)(?<Version>[\d\.]+).exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex
    $version = $matches.Version

    return @{
        Version = $matches.Version
        URL32 = 'http://www.epidata.dk/downloads/epidata-all-in-one-setup.' + $version + '.exe'
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