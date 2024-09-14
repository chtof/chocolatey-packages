import-module au

function global:au_GetLatest {
    $releases = 'https://basilisk-browser.org/download.shtml'    
    $regex64  = 'basilisk-(?<Version>[\d]+)[\d]{6}.win64.installer.exe'

    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $download_page |? href -match $regex64 | Select -Last 1 | Out-Null        

    return @{
        Version = $matches.Version -replace '([\d]+)([\d]{2})([\d]{2})','$1.$2.$3'    
    }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""            
        }
    }
}

update -ChecksumFor none -NoCheckUrl