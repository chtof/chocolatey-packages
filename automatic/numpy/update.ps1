import-module au
. ..\..\helpers\GitHub_Helper.ps1

<# function global:au_GetLatest {
	$github_repository = "numpy/numpy"
	$releases = "https://github.com/" + $github_repository + "/releases/latest"
	$regex   = "Release v(?<Version>[\d\.]+) · "

	$url = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
	return @{
		Version = $matches.Version
	}
} #>

function global:au_GetLatest {
	$url = Get-RedirectedUrl 'https://github.com/numpy/numpy/releases/latest'
	
	return @{
		Version = $url -replace '.*/v([\d\.]+)$', '$1'
	}
   
}


function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }        
    }
}

update -ChecksumFor none -NoCheckUrl