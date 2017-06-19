#Arrays
# use negatives to coun
set var1 to {"monday", "tuesday", "wednesday", "thursday", "friday"}
set var2 to {"sunday", "saturday"}
set var3 to var1 & var2

#replace
set item 6 of var3 to "SATURDAY"
set item 7 of var3 to "SUNDAY"
get var3
log var3

#using negatives will count from back of list

set item -3 of var3 to "Friday"
get var3

log var3

#display alert var3

set subset to items 2 through 4 of var3

log subset

#random value

set randomDay to some item of var3
log "random item " & randomDay

#length
set lengthOfArray to length of var3
log "length of array: " & lengthOfArray

set a to 2 as list
set b to 4 as list
set c to a & b
log c

#add string to a list
set stringVar to "string"
set listVar to {"test"}
set resultVar to listVar & stringVar
log resultVar

