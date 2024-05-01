import-module au

function global:au_GetLatest {
    $releases = Get-RedirectedUrl 'https://downloads-app.iplayer.api.bbc.co.uk/stable/win32-x64'    
	$regex   = 'BBCiPlayerDownloadsSetup-(?<Version>[\d\.]+)\.exe$'
    $releases -Match $regex | Out-Null
	
    return @{ Version = $matches.Version ; URL32 = $releases }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"            
        }
    }
}

update -ChecksumFor None
