;    _  _   _ _____ ___    _  _  ___ _____   _  _______   __  ___  ___ ___ ___ ___ _____ ___ 
;   /_\| | | |_   _/ _ \  | || |/ _ \_   _| | |/ / __\ \ / / / __|/ __| _ \_ _| _ \_   _/ __|
;  / _ \ |_| | | || (_) | | __ | (_) || |   | ' <| _| \ V /  \__ \ (__|   /| ||  _/ | | \__ \
; /_/ \_\___/  |_| \___/  |_||_|\___/ |_|   |_|\_\___| |_|   |___/\___|_|_\___|_|   |_| |___/
;                                                                                            
;    _ _                   _____   __  _____ ___  _  _ _  _  ___ ____                  _ _   
;  _| | |_                | _ ) \ / / |_   _/ _ \| \| | \| |/ _ \_  /                _| | |_ 
; |_  .  _|               | _ \\ V /    | || (_) | .` | .` | (_) / /                |_  .  _|
; |_     _|               |___/ |_|     |_| \___/|_|\_|_|\_|\___/___|               |_     _|
;   |_|_|                                                                             |_|_|

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;###################### FUNCTIONS DECLARATION ######################
getSelectedFilePath() {   ; GetSelectedText or FilePath in Windows Explorer  by Learning one 
	IsClipEmpty := (Clipboard = "") ? 1 : 0
	if !IsClipEmpty {
		ClipboardBackup := ClipboardAll
		While !(Clipboard = "") {
			Clipboard =
			Sleep, 10
		}
	}
	Send, ^c
	ClipWait, 0.1
	ToReturn := Clipboard, Clipboard := ClipboardBackup
	if !IsClipEmpty
	ClipWait, 0.5, 1
	Return ToReturn
}

;###################### SCRIPT 1; CTRL+SHIFT+MINUS(KEYPAD); SHUTDOWN COMPUTER ######################
^+NumpadSub::
Shutdown, 5 
Return

;###################### SCRIPT 2; CTRL+SHIFT+F; CREATE A NEW FILE IN THE ACTIVE DIRECTORY (ACTIVE WINDOW) ######################
^+f::
ControlGetText, TW, ToolbarWindow323, ahk_class CabinetWClass
address:=SubStr(TW,10) "\newFile.txt"
Run, C:\Program Files (x86)\Notepad++\notepad++.exe %address% 
Return

;###################### SCRIPT 3; CTRL+SHIFT+P; COPY THE PATH OF THE SELECTED ELEMENT ######################
 ^+p::clipboard = % getSelectedFilePath()  ; save the highlited file path to the clipboard
Return

;###################### SCRIPT 4; CTRL+SHIFT+Q; OPEN THE SELECTED FILE WITH NOTEPAD++ ######################
 ^+q::
 path:=getSelectedFilePath()
 Run, C:\Program Files (x86)\Notepad++\notepad++.exe %path%  ; save the highlited file path to the clipboard
Return 
;##################### SCRIPT 5; CTRL+SHIFT+UP,DOWN; VOLUME CONTROL ######################
^+Up:: Send {Volume_Up 3}  ; Raise the master volume by 3 intervals.
Return
^+Down:: Send {Volume_Down 3} ; Lower the master voulme by 3 intervals.
Return


