; REMOVED: #NoEnv  ; No longer used in AHK v2, this is now the default
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SetTitleMatchMode(2) ; A windows's title can contain WinTitle anywhere inside it to be a match
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay(0)
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

winTitle := "Setup - JACK2"

; Installing Jack
WinWait(winTitle, "Welcome to the JACK", 120)
ControlClick("&Next", winTitle)

; Readme
;WinWait, %winTitle%, Readme, 10
;ControlClick, &Next, %winTitle%

; License Agreement
WinWait(winTitle, "License Agreement", 10)
Sleep(500)
;ControlClick, Button4, %winTitle% ; I &agree with the above terms and conditions
ControlClick("TNewRadioButton1", winTitle) ; I &agree with the above terms and conditions
ControlClick("&Next", winTitle)

; Components
WinWait(winTitle, "Select Components", 10)
Sleep(500)
ControlClick("&Next", winTitle)

; Select Start Menu Folder
WinWait(winTitle, "Select Start Menu Folder", 10)
Sleep(500)
ControlClick("&Next", winTitle)

; Ready to Install
WinWait(winTitle, "Ready to Install", 10)
Sleep(500)
ControlClick("&Install", winTitle)

; Jack has been successfully installed!
WinWait(winTitle, "Completing the JACK2 Setup Wizard", 30)
ControlClick("&Finish", winTitle)
;ControlClick, &Next >, %winTitle%

; Ready to Install
WinWait, %winTitle%, Ready to Install, 10
Sleep 500
ControlClick, &Install, %winTitle%

; Jack has been successfully installed!
WinWait, %winTitle%, Completing the JACK2 Setup Wizard, 30
ControlClick, &Finish, %winTitle%
;ControlClick, &Next >, %winTitle%
