import-module au

function global:au_GetLatest {
    $releases  = 'https://developer.nvidia.com/cuda-downloads.json'
    #$regex_url = "https://developer.download.nvidia.com/compute/cuda/(?<MajorVersion>[\d\.]+)/local_installers/cuda_(?<VersionMajor>[\d\.]+)_(?<VersionMinor>[\d]+)(.\d+)?_windows.exe"
    $regex_url = "https://developer.download.nvidia.com/compute/cuda/(?<MajorVersion>[\d\.]+)/local_installers/cuda_(?<VersionMajor>[\d\.]+)_?(?<VersionMinor>[\d]+)(.\d+)?_windows.exe"
    $json = (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content | ConvertFrom-Json 
    #$json.data.releases.'Windows/x86_64/11/exe_local'.filename

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regex_url | Out-Null

    return @{
        Version = $matches.VersionMajor + '.' + ($matches.VersionMinor -replace '\.','')
        URL32   = $matches[0]
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update -NoCheckUrl