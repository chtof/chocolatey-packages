import-module au

function global:au_GetLatest {
	$releases = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing    
    $regex   = 'kdevelop-master-(?<Version>[\d\.-]+)-windows-cl-msvc\d+-x86_64.7z$'
    $url     = $download_page.links | ? href -match $regex
    $version = $matches.Version -Replace '-', '.'
 
    return @{ Version = "5.6.2."+$version ; URL64 = $releases + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{          
            "(^(\s)*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -checksumFor 64
}