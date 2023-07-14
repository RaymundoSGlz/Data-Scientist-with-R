# If the speed is greater than 48, have R print out "Slow down big time!",
# and decrease the speed by 11.
# Otherwise, have R simply print out "Slow down!", and decrease the speed by 6.

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is", speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}
