# Completa la definición de extremes_avg():
# toma un vector de temperaturas y calcula
# el promedio de las temperaturas mínima y máxima del vector.
# Luego, usa esta función dentro de sapply()
# para aplicarla sobre los vectores dentro de temp.

# Use the same function over temp with lapply() and see how the outputs differ.

# temp is already defined in the workspace
temp <- list(
    c(3, 7, 9, 6, -1),
    c(6, 9, 12, 13, 5),
    c(4, 8, 3, -1, -3),
    c(1, 4, 7, 2, -2),
    c(5, 7, 9, 4, 2),
    c(-3, 5, 8, 9, 4),
    c(3, 6, 9, 4, 1)
)

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
    (min(x) + max(x)) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)
