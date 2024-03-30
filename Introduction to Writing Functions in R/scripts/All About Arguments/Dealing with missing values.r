library(dplyr)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")
get_reciprocal <- function(x) {
  1 / x
}

# 1. Modifica la firma y el cuerpo de `calc_harmonic_mean()`
## para que tenga un argumento `na.rm`, por defecto en falso,
## que se pasa a `mean()`.

# Add an na.rm arg with a default, and pass it to mean()
calc_harmonic_mean <- function(x, na.rm = FALSE) {
  x %>%
    get_reciprocal() %>%
    mean(na.rm = na.rm) %>%
    get_reciprocal()
}

# 2. Utilizando `std_and_poor500`, agrupa por `sector`,
## y resume para calcular la media armónica de las relaciones
## precio/ganancias en la columna `pe_ratio`, eliminando los valores faltantes.

std_and_poor500 %>%
  # Group by sector
  group_by(sector) %>%
  # Summarize, calculating harmonic mean of P/E ratio
  summarize(hmean_pe_ratio = calc_harmonic_mean(pe_ratio, na.rm = TRUE))