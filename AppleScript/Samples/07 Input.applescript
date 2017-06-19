#button input default buttons
set result to display dialog "Choose Option" default button "Cancel"
#my buttons
set result to display dialog "Choose Option" buttons {"Option 1", "Option 2"} default button "Option 2"
set buttonReturned to button returned of result

set textInput to display dialog "Enter some text" default answer "N/A" buttons {"b1", "b2", "b3"}
log textInput
set textReturned to text returned of textInput