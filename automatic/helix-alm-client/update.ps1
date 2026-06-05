import-module au

function global:au_GetLatest {
    $releases = 'https://filehost.perforce.com/alm/helixalm/'
    $folder = (Invoke-WebRequest -Uri $releases -useBasicParsing).links.href | Select -Last 1
    
    $version = $folder -Replace 'r([\d\.]{8,})/', '$1'

    return @{
        Version = $version
        URL32   = $releases + $folder + 'ttwinclientinstall.exe'        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update