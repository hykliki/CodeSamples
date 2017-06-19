tell application "TextEdit"
	activate
	make new document
end tell
tell application "System Events"
	keystroke "Hello"
	key code 36
	keystroke "Goodby"
end tell
