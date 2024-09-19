; Path to the subfolder containing your scripts
scriptFolder := A_Startup "\ahkScripts"

; Loop through all .ahk files in the subfolder and its subfolders
Loop, Files, %scriptFolder%\*.ahk, R
{
    ; Run each .ahk script found
    Run, %A_LoopFileFullPath%
}