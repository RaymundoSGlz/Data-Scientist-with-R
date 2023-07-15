# Al igual que en el ejercicio anterior,
# recorre la lista nyc de dos maneras diferentes para imprimir sus elementos:

# Recorre directamente la lista nyc (versión de bucle 1).
# Define un índice de bucle y realiza subconjuntos
# usando corchetes dobles (versión de bucle 2).

# The nyc list is already specified
nyc <- list(pop = 8405837,
    boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"),
            capital = FALSE)

# Loop version 1
for (i in nyc) {
  print(i)
}

# Loop version 2
for (i in seq_along(nyc)) {
  print(nyc[[i]])
}
