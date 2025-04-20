SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0

; Welcome to Locale Emulator.
winTitle1 := "LE Context Menu Installer - V"
WinWait winTitle1, "Welcome to Locale Emulator!", 30 ;
ControlClick "WindowsForms10.BUTTON.app.0.141b42a_r8_ad12", winTitle1

; Uninstall finished.
winTitle2 := "LE Context Menu Installer"
WinWait winTitle2 "ahk_class #32770", "Uninstall finished.", 30 ; 
ControlClick "OK", winTitle2, "Uninstall finished.",,"NA"

WinActivate winTitle1
WinClose winTitle1