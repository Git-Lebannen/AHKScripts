; This script hides the mouse cursor after a set amount of time (default is 5 secs)
; No hotkey is required for this script
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
InstallMouseHook ; Required for A_TimeIdleMouse

while True {

    ; after the set time of inactivity
    if A_TimeIdleMouse > 5000 {     
        ; DLLCall("SetSystemCursor")
    } else {
    }
}
