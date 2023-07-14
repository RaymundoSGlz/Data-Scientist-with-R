# Adapt the while loop such that it is abandoned
# when the speed of the vehicle is greater than 80.
# This time, the speed variable has been initialized to 88; keep it that way.

# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break()
  }
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}
