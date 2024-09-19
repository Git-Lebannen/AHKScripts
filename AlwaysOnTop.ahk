#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

lastFocused := {}

; helper to save the last focused window
saveLast() {

    global lastFocused

    ; retrieve all window IDs
    WinGet, hwndList, List

    ; Loop through each window ID and update the dict
    Loop, %hwndList%
    {
        ; Get hwnd
        hwnd := hwndList%A_Index%

        ; Get window title
        WinGetTitle, windowTitle, ahk_id %hwnd%

        windowDict[hwnd] := windowTitle
    }
}

ResetWindow(hwnd, originalTitle) {

    ; Remove the highlight when Always On Top is turned off
    WinSet, Transparent, Off, ahk_id %hwnd% ; Restore full opacity

    ; Revert the title to its original value
    WinSetTitle, ahk_id %hwnd%, %originalTitle%
}

; first windowDict update
UpdateWindowDict()

^SPACE::
    ; Get the HWND of the active window
    WinGet, hwnd, ID, A

    ; Toggle Always On Top for the active window
    WinSet, Alwaysontop, , A

    ; Check if the window is already Always On Top
    WinGet, ExStyle, ExStyle, A
    if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST
    {

        UpdateWindowDict()

        global windowDict

        for hwnd, originalTitle in windowDict {
            ResetWindow(hwnd, originalTitle)
        }

        ; Highlight the window: Set transparency
        WinSet, Transparent, 200, A  ; Set transparency to 200 (almost full opacity)

        ; Change the title to "OnTop"
        WinSetTitle, ahk_id %hwnd%, , OnTop 
    }
    else
    {
        originalTitle := windowDict[hwnd]
        ResetWindow(hwnd, originalTitle)
    }
return
