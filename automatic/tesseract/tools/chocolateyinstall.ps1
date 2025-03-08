$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\tesseract-ocr-w64-setup-5.5.0.20241111.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPath $env:ProgramFiles\Tesseract-OCR
