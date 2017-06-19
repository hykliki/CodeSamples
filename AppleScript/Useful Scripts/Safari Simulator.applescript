tell application "Safari" to activate

tell application "System Events"
	tell process "Safari"
		tell menu bar 1
			tell menu "Develop"
				tell menu item "Simulator"
					tell menu 1
						#this will fail - use your own menu item text i quotes below
						click menu item "index.html"
					end tell
				end tell
			end tell
		end tell
	end tell
end tell
