# Finish the control-flow construct with the following behavior:

# If both li and fb are 15 or higher,
# set sms equal to double the sum of li and fb.
# If both li and fb are strictly below 10,
# set sms equal to half the sum of li and fb.
# In all other cases, set sms equal to li + fb.
# Finally, print the resulting sms variable.

# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li >= 15 && fb >= 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 && fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
print(sms)
