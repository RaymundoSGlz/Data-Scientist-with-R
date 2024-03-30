library(dplyr)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")
get_reciprocal <- function(x) {
  1 / x
}

# 1. Reemplace el argumento `na.rm` con `...`
## en la firma y el cuerpo de `calc_harmonic_mean()`.

calc_harmonic_mean <- function(x, ...) {
  x %>%
    get_reciprocal() %>%
    mean(...) %>%
    get_reciprocal()
}

# 2. Usando `std_and_poor500`, agrupe por `sector`,
## y resuma para calcular la media armónica de las relaciones precio/ganancia
## en la columna `pe_ratio`, eliminando los valores faltantes.
# Swap na.rm arg for ... in signature and body

std_and_poor500 %>%
  # Group by sector
  group_by(sector) %>%
  # Summarize, calculating harmonic mean of P/E ratio
  summarize(hmean_pe_ratio = calc_harmonic_mean(pe_ratio, na.rm = TRUE))