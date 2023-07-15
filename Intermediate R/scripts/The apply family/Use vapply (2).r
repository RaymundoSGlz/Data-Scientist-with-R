# Inspecciona el código pre-cargado e intenta ejecutarlo.
# Si no has cambiado nada, debería aparecer un error.
# Esto se debe a que vapply() todavía espera que basics()
# devuelva un vector de longitud 3.
# El mensaje de error te da una indicación de lo que está mal.
# Intenta corregir el error editando el comando vapply().

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

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))
