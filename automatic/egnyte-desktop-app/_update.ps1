import-module au

function global:au_GetLatest {
    $releases = 'https://helpdesk.egnyte.com/hc/en-us/articles/205237150-Download-Egnyte-Drive-Installers'
    $regex    = 'EgnyteDesktopApp_(?<Version>[\d\._]+).msi$'
    # EgnyteDesktopApp_ renamed
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

	$url     = $download_page.links | ? href -match $regex
    $version = $matches.Version -Replace "_", "."

    return @{ Version = $version ; URL32 = $url.href }
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