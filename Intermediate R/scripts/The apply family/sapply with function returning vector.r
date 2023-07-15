# Completa la definición de la función extremes().
# Esta función toma un vector de valores numéricos
# y devuelve un vector que contiene
# los valores mínimo y máximo del vector dado,
# con los nombres "min" y "max", respectivamente.
# Aplica esta función sobre el vector temp usando sapply().
# Finalmente, aplica esta función sobre el vector temp usando lapply() también.

# temp is already available in the workspace
temp <- list(
    c(3, 7, 9, 6, -1),
    c(6, 9, 12, 13, 5),
    c(4, 8, 3, -1, -3),
    c(1, 4, 7, 2, -2),
    c(5, 7, 9, 4, 2),
    c(-3, 5, 8, 9, 4),
    c(3, 6, 9, 4, 1)
)

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)
