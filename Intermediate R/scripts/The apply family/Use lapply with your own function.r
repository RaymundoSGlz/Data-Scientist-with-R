# Aplicar select_first() sobre los elementos de split_low con lapply()
# y asignar el resultado a una nueva variable llamada names.
# Luego, escribir una función select_second() que haga exactamente lo mismo
# para el segundo elemento de un vector de entrada.
# Finalmente, aplicar la función select_second() sobre split_low
# y asignar la salida a la variable years.

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
    x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
