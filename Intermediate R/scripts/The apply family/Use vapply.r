# Aplica la función basics() sobre la lista de temperaturas, temp,
# usando vapply().

# Esta vez, puedes usar numeric(3) para especificar el argumento FUN.VALUE.

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

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))
