﻿import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate {    
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'olivierkes/manuskript'
        regex32    = '/releases/download/.*/manuskript-([\d\.-]*)-(win32|windows).zip'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor None