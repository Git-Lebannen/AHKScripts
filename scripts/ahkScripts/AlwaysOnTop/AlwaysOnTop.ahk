; This script puts the active window in always on top mode.
; The always on top window will be slightly transparent and renamed to OnTop for legibilty while tabing through windows.
; The hotkey is <CTRL> + <SPACE>
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

lastFocused := []  ; Initialize the array
currentFocused := "none"
currentID := 0

^SPACE:: { ; Get the HWND of the active window
    global ; make function global
    hwnd := WinGetID("A")

    currentID := hwnd

    ; Check if the window is currently "Always on Top"
    ExStyle := WinGetExStyle("ahk_id " currentID)
    if (ExStyle & 0x8) {  ; 0x8 is WS_EX_TOPMOST
        ; Turn off "Always on Top"
        WinSetAlwaysOnTop(0, "ahk_id " currentID)

        ; Reset the opacity of the currently focused window
        WinSetTransparent("Off", "ahk_id " currentID)

        ; Reset the window title of the currently focused window
        WinSetTitle(currentFocused, "ahk_id " currentID)

        ; Clear lastFocused as we are toggling the current window
        lastFocused := []
    } else {
        ; If there is a previously focused window, reset its attributes
        if (lastFocused.Length > 0) {
            lastFocused1 := lastFocused[1]
            lastFocused2 := lastFocused[2]

            ; Turn off "Always on Top"
            WinSetAlwaysOnTop(0, "ahk_id " lastFocused1)

            ; Reset the opacity of the last focused window
            WinSetTransparent("Off", "ahk_id " lastFocused1)

            ; Reset the window title of the last focused window
            WinSetTitle(lastFocused2, "ahk_id " lastFocused1)
        }

        ; Save the current window's details
        windowTitle := WinGetTitle("ahk_id " currentID)
        lastFocused := [currentID, windowTitle]  ; Save the hwnd and title
        currentFocused := windowTitle

        ; Toggle "Always on Top" for the active window
        WinSetAlwaysOnTop(-1, "ahk_id " currentID)

        ; Make the current window transparent and change the title
        WinSetTransparent(230, "ahk_id " currentID)
        WinSetTitle("OnTop", "ahk_id " currentID)
    }

    return
}  
