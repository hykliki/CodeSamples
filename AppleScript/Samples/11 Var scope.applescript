set var to "global variable"

on function()
	# - declare var as global
	global var
	display dialog var
end function


on functionWithLocalVar()
	set localVar to "local var"
	display dialog localVar
end functionWithLocalVar

log localVar
function()
