# Escribe un bucle for que itere sobre todos los elementos de linkedin
# e imprima cada elemento por separado.
# Haz esto de dos maneras: usando la versión de bucle 1
# y la versión de bucle 2 en el código de ejemplo de arriba.

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (i in linkedin) {
  print(i)
}

# Loop version 2
for (i in seq_along(linkedin)) { # seq_along() returns a vector
  print(linkedin[i])
}
