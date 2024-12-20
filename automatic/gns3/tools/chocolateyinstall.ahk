#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
GNS_Version = 3.0.0

; Welcome to GNS3 Setup
winTitle1 = GNS3%A_Space%%GNS_Version%%A_Space%Setup
WinWait, %winTitle1%, Welcome%A_Space%to%A_Space%GNS3%A_Space%%GNS_Version%%A_Space%Setup, 30 ; Welcome to GNS3 x.x.x Setup
Sleep, 750
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA
Sleep, 750

; License agreement
WinWait, %winTitle1%, License Agreement, 10
Sleep, 750
ControlClick, I &Agree, %winTitle1% ahk_class #32770,,,NA
Sleep, 750

; Choose Start Menu Folder
WinWait, %winTitle1%, Choose Start Menu Folder, 10
Sleep, 500
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 750
 
; Choose Components
WinWait, %winTitle1%, Choose Components, 10
Sleep, 500

; [X] GS3
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [ ] WinPCAP
ControlSend, SysTreeView321, {Space}, %winTitle1%
Sleep, 150
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [ ] Wireshark
ControlSend, SysTreeView321, {Space}, %winTitle1%
Sleep, 150
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [X] Dynamips
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [ ] QEMU
ControlSend, SysTreeView321, {Space}, %winTitle1%
Sleep, 150
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [X] VPCS
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [X] Cpulimit
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [ ] TightVNC Viewer
ControlSend, SysTreeView321, {Space}, %winTitle1%
Sleep, 150
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150

; [ ] VirtViewer
ControlSend, SysTreeView321, {Down}, %winTitle1%
Sleep, 150
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 750

; Choose Install Location
WinWait, %winTitle1%, Choose Install Location, 10
Sleep, 750
ControlClick, &Install, %winTitle1% ahk_class #32770
Sleep, 750

; Installation Complete
WinWait, %winTitle1%, Installation Complete, 60
Sleep, 750
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 750

; Solarwinds Standard Toolset
WinWait, %winTitle1%, Solarwinds Standard Toolset, 10
Sleep, 1150
ControlClick, No, %winTitle1% ahk_class #32770
Sleep, 750
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 750

; Completing GNS3 Setup
WinWait, %winTitle1%, Completing GNS3 %GNS_Version% Setup, 10
Sleep, 500
ControlClick, Start GNS3, %winTitle1% ahk_class #32770
Sleep, 750
ControlClick, &Finish, %winTitle1% ahk_class #32770
Sleep, 750
