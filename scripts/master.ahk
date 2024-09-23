; master ahk that gets called on startup
; calls all other scripts

; ! READ THE README.MD FOR CORRECT USAGE
scriptFolder := "C:\Users\USERNAME\Desktop\ahkScripts"

; Loop through all .ahk files in the folder recursively
Loop, Files, %scriptFolder%\*.ahk, R
{
    ; Run each .ahk script found
    Run, %A_LoopFileFullPath%
}
