#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_WorkingDir%/..

FileEncoding, UTF-8

; Set Local Variables
_notepad_exe := "C:\WINDOWS\system32\notepad.exe"
_read_me_file := "..\README.md"
_template_file := "..\TEMPLATE.md"
_signature := "{Enter 2}``````{Enter}This file was lastly modified by AutoHotKey{Enter}``````{Enter}"
_commit = "This file was lastly modified by AutoHotKey"

; Open the README.md file in Notepad
Run %_notepad_exe% %_read_me_file%

; Ensure window has opened
_window_title := "README.md - Notepad"
WinWait, %_window_title%, , 2

If (ErrorLevel = 1){
    TrayTip, Error, README window could not be found, , 3
    ExitApp, 1
} Else {
    Sleep, 200
    WinActivate, %_window_title%, , , 
}

; Clear the file
SendInput, ^a
Sleep, 20
SendInput, {Delete}

; Load the Template
FileRead, _template_text, %_template_file%

; Remove double Newlines
StringReplace, _template_text, _template_text, `r, , All

; Update README.md using Template
SendRaw, %_template_text%
SendRaw, %_signature%
; SendInput, ^s!{F4}

; Git Commit
RunWait, git commit README.md -m %_commit% 

; Git Push
RunWait, git push
