import-module au

function global:au_GetLatest {
    $releases        = 'https://build.openvpn.net/downloads/releases'
    #$releasesVersion = 'https://community.openvpn.net/openvpn/wiki/GettingTapWindows'
    $releasesVersion = 'https://raw.githubusercontent.com/OpenVPN/tap-windows6/master/version.m4'
    $regexProductVersion     = 'define\(\[PRODUCT_VERSION\], \[(?<ProductVersion>[\d\.]+)\]\)'
    $regexProductTapWinBuild = 'define\(\[PRODUCT_TAP_WIN_BUILD\], \[(?<ProductTapWinBuild>[\d\.]+)\]\)'    
    
    $download_page = (Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).RawContent
    $download_page -match $regexProductVersion | Out-Null
    $productVersion = $matches.ProductVersion
    $download_page -match $regexProductTapWinBuild | Out-Null
    $productTapWinBuild = $matches.ProductTapWinBuild

    return @{
        Version = $productVersion        
        URL32   = $releases + "/tap-windows-$productVersion.zip"
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{            
            "(^(\s)*url\s*=\s*)('.*')"       = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
            #"(?i)(^\s*fileFullPath\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName32)`""            
        }
    }
}

update -NoCheckUrl