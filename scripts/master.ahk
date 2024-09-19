; master ahk that gets called on startup
; calls all other scripts

; path to folder containing scripts
scriptFolder := A_Startup "\ahkScripts"

; Loop through all .ahk files in the folder recursively
Loop, Files, %scriptFolder%\*.ahk, R
{
    ; Run each .ahk script found
    Run, %A_LoopFileFullPath%
}
