import-module au

function global:au_BeforeUpdate() {  
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {	
    $releases = 'https://www.ocenaudio.com'
    $regex    = '\<h1\>ocenaudio (?<Version>[\d\.]+)\</h1\>'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content  -match $regex | Out-Null

    return @{
        Version = $matches.Version        
        URL64   = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl