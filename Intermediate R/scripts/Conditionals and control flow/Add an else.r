# Agrega una sentencia else a ambas estructuras de control, de modo que

# "Unknown medium" se imprima en la consola cuando
# la condición if en medium no se cumple.
# R imprime "Try to be more visible!" cuando
# la condición if en num_views no se cumple.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}



# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
   print("Try to be more visible!")
}
