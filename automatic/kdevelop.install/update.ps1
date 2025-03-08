import-module au

function global:au_GetLatest {
    $releases = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    #https://binary-factory.kde.org/job/KDevelop_Release_win64/lastSuccessfulBuild/artifact/kdevelop-5.6.2-1853-windows-cl-msvc2019-x86_64.exe
    $regex   = 'kdevelop-master-(?<Version>[\d\.-]+)-windows-cl-msvc\d+-x86_64.exe$'
    $url     = $download_page.links | ? href -match $regex
    $version = $matches.Version -Replace '-', '.'
 
    return @{ Version = $version ; URL64 = $releases + $url.href }
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