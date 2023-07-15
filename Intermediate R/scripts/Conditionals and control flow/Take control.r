# Completa la estructura de control con el siguiente comportamiento:

# Si tanto li como fb son 15 o más,
# establece sms igual al doble de la suma de li y fb.
# Si tanto li como fb son estrictamente menores que 10,
# establece sms igual a la mitad de la suma de li y fb.
# En todos los demás casos, establece sms igual a li + fb.
# Finalmente, imprime la variable sms resultante.

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
