import-module au

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {	
    $releases = 'https://www.ocenaudio.com'
    $regexVersion = '\<h1\>ocenaudio (?<Version>[\d\.]+)\</h1\>'

    (Invoke-WebRequest -Uri $releases).RawContent  -match $regex | Out-Null

    return @{
        Version = $matches.Version        
        URL64   = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
  update -ChecksumFor none -noCheckUrl
}