$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'https://ultraviewer.net/en/download.html'
    # The version in the software link does not always reflect the current version and must be grab where the version is complete.	
    $regex_version = 'Download UltraViewer - (?<Version>[\d\.]+)<'
    $regex    = 'UltraViewer_setup_([\d\.]+)_en.exe'
	
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | select -Last 1
    $download_page -match $regex_version | Out-Null

    return @{
        Version = $matches.Version
        URL32   = "https://www.ultraviewer.net/en/"+$url.href
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}