import-module au

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {	
    $releases = 'https://www.ocenaudio.com'
    $regex    = '\<h1\>ocenaudio (?<Version>[\d\.]+)\</h1\>'

    (Invoke-WebRequest -Uri $releases).Content  -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
        URL64   = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl