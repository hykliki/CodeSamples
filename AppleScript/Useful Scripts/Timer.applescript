display dialog "Enter timeout in Seconds" default answer "5" buttons {"Seconds", "Cancel"} default button 1 with title "Timer" with icon stop
#copy the result as list to {text_returned, button_pressed}
set a to text returned of result as number

set counter to 0
repeat a times
	set counter to counter + 1
	
	log "Time remains: " & a - counter
	delay 1
end repeat

beep
display dialog "Timeout of " & a & " is done" with title "Timer is Done" with icon stop
