; This script places the active window on top of all others and keeps it there.
; The "OnTop" window will be labeled as such, and have its opacity lowered.
; Only one window at a time can be in this state.
; Hotkey is <CTRL> + <SPACE>

#NoEnv ; Increses performance, avoids bugs caused by environment variables
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Initialize a few global variables
lastFocused := []
currentFocused := "none"
currentID := 0

; When the hotkey is activated
^SPACE::
    ; Get the HWND of the active window
    WinGet, hwnd, ID, A
    currentID := hwnd

    ; Check if the window is currently "Always on Top"
    WinGet, ExStyle, ExStyle, ahk_id %currentID%
    if (ExStyle & 0x8) {  ; 0x8 is WS_EX_TOPMOST
        ; If so, turn off "Always on Top", reset the style and name of the window
        WinSet, AlwaysOnTop, Off, ahk_id %currentID%
        WinSet, Transparent, Off, ahk_id %currentID%
        WinSetTitle, ahk_id %currentID%, , %currentFocused%

        ; Clear lastFocused as it's the same as the window that's getting reset
        lastFocused := []
    } else {
        ; If the window isn't yet "Always on Top"
        if (lastFocused.Length() > 0) {
            ; If there is a previously focused window, reset its attributes
            lastFocused1 := lastFocused[1]
            lastFocused2 := lastFocused[2]

            ; Turn off "Always on Top", reset the style and name of the window
            WinSet, AlwaysOnTop, Off, ahk_id %lastFocused1%
            WinSet, Transparent, Off, ahk_id %lastFocused1%
            WinSetTitle, ahk_id %lastFocused1%, , %lastFocused2%
        }

        ; Save the current window's details
        WinGetTitle, windowTitle, ahk_id %currentID%
        lastFocused := [currentID, windowTitle]  ; Save the hwnd and title
        currentFocused := windowTitle

        ; Toggle "Always on Top", make the window transparent and change its title to "OnTop"
        WinSet, AlwaysOnTop, Toggle, ahk_id %currentID%
        WinSet, Transparent, 230, ahk_id %currentID%
        WinSetTitle, ahk_id %currentID%, , OnTop
    }
return
