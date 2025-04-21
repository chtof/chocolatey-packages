#NoTrayIcon
SetTitleMatchMode 2 ; A windows's title can contain WinTitle anywhere inside it to be a match
SendMode "Input"    ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay -1

winTitle := "Setup - JACK2"

; Installing Jack
WinWait(winTitle, "Welcome to the JACK", 120)
ControlClick "&Next", winTitle

; License Agreement
WinWait(winTitle, "License Agreement", 20)
ControlClick "TNewRadioButton1", winTitle ; I &agree with the above terms and conditions
ControlClick "&Next", winTitle

; Components
WinWait(winTitle, "Select Components", 20)
ControlClick "&Next", winTitle

; Select Start Menu Folder
WinWait(winTitle, "Select Start Menu Folder", 20)
ControlClick "&Next", winTitle

; Ready to Install
WinWait(winTitle, "Ready to Install", 20)
ControlClick "&Install", winTitle

; Jack has been successfully installed!
WinWait(winTitle, "Completing the JACK2 Setup Wizard", 60)
ControlClick "&Finish", winTitle