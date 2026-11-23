import-module au

function global:au_GetLatest {
    $releases = 'https://infinitekind.com/download-moneydance-personal-finance-software'
    $regex = '\<span class="download_detail"\>Moneydance [\d\.]+ \((?<Version>\d+)\)\</span\>'

	(Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null

	return @{
		Version = "0.0." + $matches.Version
        URL64   = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
	}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }        
    }
}

update -ChecksumFor 64
