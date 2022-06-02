#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_WorkingDir%/..

FileEncoding, UTF-8

; Open the README.md file in Notepad
Run C:\WINDOWS\system32\notepad.exe README.md

; Ensure window has opened
WinWait, README.md - Notepad, , 2

If (ErrorLevel = 1){
    TrayTip, Error, README window could not be found, , 3
    ExitApp, 1
} Else {
    Sleep, 200
    WinActivate, README.md - Notepad, , , 
}

; Clear the file
SendInput, ^a
Sleep, 20
SendInput, {Delete}
Sleep, 50

; Load the Template
FileRead, _template_text, TEMPLATE.md

; Remove double Newlines
StringReplace, _template_text, _template_text, `r, , All

; Update README.md using Template
SendRaw, %_template_text%
SendInput, {Enter 2}``````{Enter}This file was lastly modified by AutoHotKey{Enter}``````{Enter}
SendInput, ^s!{F4}

; Git Commit
RunWait, git commit README.md -m "This file was lastly modified by AutoHotKey", , Hide, 

; Git Push
RunWait, git push, , Hide, 
