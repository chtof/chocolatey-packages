#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  

winTitle1 := "Little Fighter Install Program ahk_class InstItClass"
WinWait(winTitle1,, 300)
ControlClick "Button1", winTitle1 ; &Next >
Sleep 750

; License agreement
ControlClick "Button4", winTitle1 ; I agree with the above terms and conditions
Sleep 750
ControlClick "Button1", winTitle1 ; &Next >
Sleep 750

; Directory
ControlClick "Button1", winTitle1 ; &Next >
Sleep 750

winTitle2 := "Little Fighter Install Program ahk_class #32770"
WinWait(winTitle2,, 3)
if WinExist(winTitle2)
{
	; Create destination directory directory	
	ControlClick "Button1", winTitle2 ; &Next >
	Sleep 750
}

; Little Fighter has been successfully installed.
WinWait(winTitle1, "Launch Little Fighter", 180)
ControlClick "Button5", winTitle1 ; Disable "Launch Little Fighter"
Sleep 1000
ControlClick "Button1", winTitle1 ; Exit