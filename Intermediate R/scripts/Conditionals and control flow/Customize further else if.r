# Agregue código a ambas estructuras de control de tal manera que:

# R imprima "Showing Facebook information"
# si medium es igual a "Facebook". Recuerde R distingue mayúsculas y minúsculas.
# "Your number of views is average" se imprime si num_views
# está entre 15 (incluido) y 10 (excluido).
# Siéntase libre de cambiar las variables medium y num_views
# para ver cómo responde la estructura de control. En ambos casos,
# el código existente debe extenderse en la instrucción else if.
# No se debe modificar ningún código existente.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
    print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 && num_views > 10) {
    print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
