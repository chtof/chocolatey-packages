$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	#$releases = 'https://gridtracker.org/index.php/downloads/gridtracker'
    $releases = 'https://gridtracker.org/index.php/downloads/gridtracker-downloads'
    #https://downloads.gridtracker.org/v1.23.0402/GridTracker-Installer.1.23.0402.exe
	#https://download2.gridtracker.org/GridTracker2-2.250201.1-setup.exe

    $regex = '/GridTracker\d*-(Installer.)?(?<Version>[\d.]+)(-setup)?.exe'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = ($download_page.links | ? href -match $regex | select -First 1).href

    
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

update -noCheckUrl