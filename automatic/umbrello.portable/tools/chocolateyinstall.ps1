$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\umbrello-mingw32-2.31.2-lp151.49.1-portable.7z"
  file64        = "$toolsDir\umbrello-mingw64-2.31.2-lp151.121.1-portable.7z"
}

# Shim only umbrello.exe
foreach ( $file in 'dbus-daemon.exe', 'dbus-launch.exe', 'dbus-monitor.exe', 'dbus-send.exe', 'dbus-update-activation-environment.exe', 'drkonqi.exe', 'enchant-lsmod.exe', 'enchant.exe', 'gspawn-win64-helper-console.exe', 'gspawn-win64-helper.exe', 'kbuildsycoca4.exe', 'kcmshell4.exe', 'kconfig_compiler.exe', 'kconf_update.exe', 'kcookiejar4.exe', 'kdbgwin.exe', 'kde4-config.exe', 'kdebugdialog.exe', 'kded4.exe', 'kdeinit4.exe', 'khc_indexbuilder.exe', 'khelpcenter.exe', 'kioslave.exe', 'kio_http_cache_cleaner.exe', 'kjs.exe', 'kjscmd.exe', 'klauncher.exe', 'kmailservice.exe', 'kross.exe', 'ksendbugmail.exe', 'ktelnetservice.exe', 'ktrash.exe', 'kuiserver.exe', 'kwalletd.exe', 'kwinshutdown.exe', 'kwinstartmenu.exe', 'kwrapper4.exe', 'makekdewidgets.exe', 'po2xmi.exe', 'qdbus.exe', 'qdbusviewer.exe', 'update-mime-database.exe', 'xmi2pot.exe' ){
  New-Item -path $toolsDir\umbrello-2.31.2\bin -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs -DisableLogging
    
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Umbrello.lnk"
$targetPath = Join-Path $toolsDir "umbrello-2.31.2\bin\umbrello.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
