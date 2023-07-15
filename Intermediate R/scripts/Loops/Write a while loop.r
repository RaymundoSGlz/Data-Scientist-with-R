# Codifica un bucle while con las siguientes características:

# La condición del bucle while debe verificar si la velocidad es mayor que 30.
# Dentro del cuerpo del bucle while, imprime "Slow down!".
# Dentro del cuerpo del bucle while, disminuye la velocidad en 7 unidades
# y asigna este nuevo valor a la variable speed nuevamente.
# Este paso es crucial;
# de lo contrario, tu bucle while nunca se detendrá y tu sesión expirará.

# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
}

# Print out the speed variable
speed
