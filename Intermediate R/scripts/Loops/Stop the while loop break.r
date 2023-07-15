# Adaptar el ciclo while de modo que se abandone
# cuando la velocidad del vehículo es superior a 80.
# Esta vez, la variable de velocidad se ha inicializado a 88;
# déjalo de esa forma.

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
