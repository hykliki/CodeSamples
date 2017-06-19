on myFunction(param)
	display dialog param
end myFunction


on addFunction(param1, param2)
	return param1 + param2
end addFunction

myFunction("param")

display dialog addFunction(2, 5)