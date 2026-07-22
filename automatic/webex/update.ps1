import-module au

function global:au_BeforeUpdate() {
     $Latest.Checksum = Get-RemoteChecksum $Latest.URL
}

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"   = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
    }
}

function global:au_GetLatest {
  $new_url = (Invoke-RestMethod -Uri 'https://client-upgrade-a.wbx2.com/client-upgrade/api/v1/webexteamsdesktop/upgrade/@me?channel=gold&model=win-64').manifest.manualInstallPackageLocation
  $version = (Invoke-RestMethod -Uri 'https://client-upgrade-a.wbx2.com/client-upgrade/api/v1/webexteamsdesktop/upgrade/@me?channel=gold&model=win-64').manifest.version
    @{
        URL   = $new_url
        Version = $version
    }
}

update -ChecksumFor none