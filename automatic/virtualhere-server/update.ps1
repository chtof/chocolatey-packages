$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {    
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
	$releases = 'https://virtualhere.com/windows_server_software'
	$regex    = '\>version (?<Version>[\d\._]+) Changes\<'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version        
        URL64   = 'https://www.virtualhere.com/sites/default/files/usbserver/vhusbdwinw64.exe'        
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

update -ChecksumFor none