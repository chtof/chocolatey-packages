$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $url = Get-RedirectedUrl 'https://gopro.com/downloads/PC/Quik/latest'
	$regex    = 'GoPro_Quik-WinInstaller-(?<Version>[\d\.]+).exe'

    $url -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = $url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }

        "tools\chocolateyinstall.ahk" = @{
            "GoPro_Quik-WinInstaller-([\d\.]+).exe" = "GoPro_Quik-WinInstaller-`${1}.exe"
        }
    }
}

update