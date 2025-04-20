#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

winTitle1 := "LE Context Menu Installer - V"
WinWait(winTitle1,,20)
WinActivate
ControlClick "WindowsForms10.BUTTON.app.0.141b42a_r8_ad12", winTitle1,,,,"NA"

; Install finished.
SetTitleMatchMode 2
winTitle2 := "LE Context Menu Installer"
WinWait (winTitle2, "Install finished.", 10)
WinActivate winTitle2
ControlClick "OK", winTitle2

WinActivate winTitle1
WinClose winTitle1