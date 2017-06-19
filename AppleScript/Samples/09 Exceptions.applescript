set condition to false
repeat until condition is true
	try
		set age to display dialog "Enter your age" default answer "Age here"
		set ageVal to text returned of age as number
		set condition to true
	on error
		beep
		display alert "wrong input"
	end try
	display alert ageVal
end repeat