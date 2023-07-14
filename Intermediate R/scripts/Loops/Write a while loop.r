# Code a while loop with the following characteristics:

# The condition of the while loop should check if speed is higher than 30.
# Inside the body of the while loop, print out "Slow down!".
# Inside the body of the while loop, decrease the speed by 7 units
# and assign this new value to speed again.
# This step is crucial;
# otherwise your while loop will never stop and your session will expire.

# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
}

# Print out the speed variable
speed
