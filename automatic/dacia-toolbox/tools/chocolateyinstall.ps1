$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2024_04_10_10_53/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = '76E77D982B65C83E442A12BB61FEDDDCE980BA3A45E792CFBB38625BE28BEB57'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
