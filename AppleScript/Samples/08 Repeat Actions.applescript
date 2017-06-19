# repeat 
repeat 3 times
	beep
	log "repeating..."
end repeat


set condition to false
repeat until condition is true
	beep
	log "repeat once and set to true..."
	set condition to true
end repeat


set condition to 0

repeat until condition ³ 5
	log ("repeating ... " & condition as string) & " ..."
	set condition to condition + 1
end repeat