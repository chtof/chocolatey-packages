﻿Update-SessionEnvironment
$version = '2.3.0'
 
$proxy = Get-EffectiveProxy
if ($proxy) {
  Write-Host "Setting CLI proxy: $proxy"
  $env:http_proxy = $env:https_proxy = $proxy
}
python -m pip install beets==$version
