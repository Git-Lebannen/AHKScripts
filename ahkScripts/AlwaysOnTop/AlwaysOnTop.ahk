; This script puts the active window in always on top mode.
; The always on top window will be slightly transparent and renamed to OnTop for legibilty while tabing through windows.
; The hotkey is <CTRL> + <SPACE>
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

lastFocused := []  ; Initialize the array
currentFocused := "none"
currentID := 0

^SPACE::
    ; Get the HWND of the active window
    WinGet, hwnd, ID, A

    currentID := hwnd

    ; Check if the window is currently "Always on Top"
    WinGet, ExStyle, ExStyle, ahk_id %currentID%
    if (ExStyle & 0x8) {  ; 0x8 is WS_EX_TOPMOST
        ; Turn off "Always on Top"
        WinSet, AlwaysOnTop, Off, ahk_id %currentID%

        ; Reset the opacity of the currently focused window
        WinSet, Transparent, Off, ahk_id %currentID%

        ; Reset the window title of the currently focused window
        WinSetTitle, ahk_id %currentID%, , %currentFocused%

        ; Clear lastFocused as we are toggling the current window
        lastFocused := []
    } else {
        ; If there is a previously focused window, reset its attributes
        if (lastFocused.Length() > 0) {
            lastFocused1 := lastFocused[1]
            lastFocused2 := lastFocused[2]

            ; Turn off "Always on Top"
            WinSet, AlwaysOnTop, Off, ahk_id %lastFocused1%

            ; Reset the opacity of the last focused window
            WinSet, Transparent, Off, ahk_id %lastFocused1%

            ; Reset the window title of the last focused window
            WinSetTitle, ahk_id %lastFocused1%, , %lastFocused2%
        }

        ; Save the current window's details
        WinGetTitle, windowTitle, ahk_id %currentID%
        lastFocused := [currentID, windowTitle]  ; Save the hwnd and title
        currentFocused := windowTitle

        ; Toggle "Always on Top" for the active window
        WinSet, AlwaysOnTop, Toggle, ahk_id %currentID%

        ; Make the current window transparent and change the title
        WinSet, Transparent, 230, ahk_id %currentID%
        WinSetTitle, ahk_id %currentID%, , OnTop
    }
return
