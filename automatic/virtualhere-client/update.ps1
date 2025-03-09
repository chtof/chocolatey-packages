$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {    
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
	$releases = 'https://virtualhere.com/usb_client_software'
	$regex    = '\>Version (?<Version>[\d\.]+)\<'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL64   = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{            
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor 64 -NoCheckUrl
