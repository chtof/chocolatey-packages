# Author: Christophe Lefebvre
# Last Change: 02-May-2024

<#
.SYNOPSIS
   SemVer 2.0 needs to versions containing 4 digits.

.DESCRIPTION
   This function appends needed digits to have a version with 4 digits: 1.3 -> 1.3.0.0
#>
function global:semver () {
    Param( 
        [parameter(position=0)]
        $Version        
        )

    $semVer2MissingDigits = 4 - $Version.split('.').count
    for ($i=0 ; $i -lt $semVer2MissingDigits ; $i++) {
        $Version += '.0'
    }

    return $Version
}