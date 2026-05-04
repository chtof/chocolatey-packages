import-module au

function global:au_GetLatest {
    $releases  = 'https://developer.nvidia.com/cuda-downloads.json'
    # URL examples :
    # https://developer.download.nvidia.com/compute/cuda/13.2.0/local_installers/cuda_13.2.0_windows.exe
    $regex_url = "https://developer.download.nvidia.com/compute/cuda/(?<MajorVersion>[\d\.]+)/local_installers/cuda_(?<VersionMajor>[\d\.]+)_windows.exe"
    $json = (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content | ConvertFrom-Json 
    $json.data.releases.'Windows/x86_64/11/exe_local'.filename

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regex_url | Out-Null

    return @{
        Version = $matches.VersionMajor
        URL32   = $matches.0
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