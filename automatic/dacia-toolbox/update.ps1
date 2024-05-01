import-module au

function global:au_GetLatest {
	$releases = Get-RedirectedUrl 'https://dacia-ulc.naviextras.com/downloadagent?op=win'
	$regex    = '/(?<VersionYY>[\d]+)_(?<VersionMM>\d+)_(?<VersionDD>\d+)_.*/'

    $VersionYY = [int]$matches.VersionYY
    $VersionMM = [int]$matches.VersionMM
    $VersionDD = [int]$matches.VersionDD

    $releases -match $regex | Out-Null

    return @{
        Version = "$VersionYY" + '.' + "$VersionMM" + '.' + "$VersionDD"
        URL32   = $releases
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