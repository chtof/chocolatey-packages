#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay -1

Post_install_scriptDir := "C:\Program Files\GNU Octave\Octave-10.2.0\post-install.bat"

winTitle := "GNU Octave ahk_class #32770" ; ahk_exe Octave-10.2.0-w64-installer.exe

SetTitleMatchMode "RegEx"
WinWait(winTitle, "the installer was unable to find a Java Runtime Environment|Welcome to GNU Octave Setup", 600)
If WinExist(winTitle, "the installer was unable to find a Java Runtime Environment")
{
  ControlClick "Button1", winTitle,,,,"NA" ; &Yes
  WinWait(winTitle, "Welcome to GNU Octave Setup", 15)
}
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; &Next >

SetTitleMatchMode 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
WinWait(winTitle, "Welcome to GNU Octave Setup", 900)
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; &Next >

WinWait(winTitle, "License Agreement", 15)
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; &Next >

WinWait(winTitle, "Install Options", 15)
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; &Next >

WinWait(winTitle, "Choose Install Location", 15)
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; &Install

; https://github.com/chocolatey-community/chocolatey-package-requests/issues/487
; PS Installation script can't be finished due to "%MSYSDIR%\bin\bash.exe --login -c echo" in post-install.bat script
;While !FileExist(Post_install_scriptDir) ; Wait for the extraction of post-install.bat script
;{
;    Sleep, 3000
;}
Sleep 10000
BUFF := FileRead(Post_install_scriptDir)
;StringReplace (BUFF, BUFF, , , All)
BUFF := StrReplace(BUFF, "`"%MSYSDIR%\bin\bash.exe`" --login -c echo", "REM ** Chocolatey installation fix** `"%MSYSDIR`%\bin\bash.exe`" --login -c echo")
FileDelete Post_install_scriptDir
FileAppend BUFF, Post_install_scriptDir

WinWait(winTitle, "Completing GNU Octave Setup", 900)
WinActivate
Sleep 350
ControlClick "Button4", winTitle,,,,"NA" ; Don't launch octave automatically after the end of the installation
Sleep 350
ControlClick "Button2", winTitle,,,,"NA" ; &Finish
