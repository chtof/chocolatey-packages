﻿import-module au

function global:au_GetLatest {
    $releases = "https://github.com/botpress/botpress/releases/latest"
    $releases_download = "https://s3.amazonaws.com/botpress-binaries/"
    $regex   = '/botpress/botpress/releases/tag/v(?<Version>[\d\.]*)"'
	(Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex | out-null
	$version_download = $matches.Version -replace "\.", "_"
	return @{
        Version = $matches.Version
        URL64 = $releases_download + "botpress-v" + $version_download + "-win-x64.zip"
        zipFileName = "botpress-v" + $version_download + "-win-x64.zip"
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }    
        "tools\chocolateyuninstall.ps1" = @{
            '(.*zipFileName\s*=\s*)(".*")' = "`$1`"$($Latest.zipFileName)`""
        }
    }
}

update