; This script opens directories that are specified in the program by the individual user.
; Directories can be opened in cmd or the file explorer, depening on the hotkey.
; File explorer hotkeys are LButton + <F1> to <F12>
; CMD hotkeys are RButton + <F1> to <F12>
; ! Attention User, this script requires a "directories.txt" file to be placed in the same directory as this script.
; ! It must be formatted with each directory inputted as text, each path seperated by a ";", no spaces, no quotes.
; ! Example:
; C:\Users\Lebannen\Coding\ahkScripts;C:\Users\Lebannen\Documents;C:\Users\Lebannen\Pictures
SendMode("Input") ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory

dirs := {}

; read directories file into an array
LoadedText := FileRead("directories.txt")
dirs := StrSplit(LoadedText, ";")

; It's just 24 keybinds, nothing to worry about :D

; explorer keybinds
~LButton & F1::ExploreDir(1)
~LButton & F2::ExploreDir(2)
~LButton & F3::ExploreDir(3)
~LButton & F4::ExploreDir(4)
~LButton & F5::ExploreDir(5)
~LButton & F6::ExploreDir(6)
~LButton & F7::ExploreDir(7)
~LButton & F8::ExploreDir(8)
~LButton & F9::ExploreDir(9)
~LButton & F10::ExploreDir(10)
~LButton & F11::ExploreDir(11)
~LButton & F12::ExploreDir(12)

; cmd keybinds
~space & F1::CMDDir(1)
~space & F2::CMDDir(2)
~space & F3::CMDDir(3)
~space & F4::CMDDir(4)
~space & F5::CMDDir(5)
~space & F6::CMDDir(6)
~space & F7::CMDDir(7)
~space & F8::CMDDir(8)
~space & F9::CMDDir(9)
~space & F10::CMDDir(10)
~space & F11::CMDDir(11)
~space & F12::CMDDir(12)

; open the directory in the file explorer 
ExploreDir(i) { 
    try {
        global dirs
        path := dirs[i]
        Run path
    }
}

; open the directory in CMD
CMDDir(i) {
    try {
        global dirs
        path := dirs[i]
        Run "CMD.exe", path, "Max"
        winID := WinGetID("A")
        winActivate(winID)
    }
}
