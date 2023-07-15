# Aplicar print_info() sobre el contenido de temp con sapply().
# Repetir este proceso con lapply(). ¿Notas la diferencia?

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

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

# Apply print_info() over temp using lapply()
lapply(temp, print_info)
