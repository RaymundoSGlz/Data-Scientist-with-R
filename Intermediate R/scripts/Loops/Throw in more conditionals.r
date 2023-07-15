# Si la velocidad es mayor que 48, haz que R imprima "Slow down big time!",
# y disminuye la velocidad en 11.
# De lo contrario, imprima "Slow down!",y disminuye la velocidad en 6.

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
