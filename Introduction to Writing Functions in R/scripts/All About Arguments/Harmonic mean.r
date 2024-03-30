library(dplyr)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")

# 1.*Observa `std_and_poor500` (lo necesitarás más tarde).* Escribe una función,
## `get_reciprocal`, para obtener el recíproco de una entrada `x`.
## Su único argumento debe ser `x`, y debería devolver uno sobre `x`.

# Look at the Standard and Poor 500 data
glimpse(std_and_poor500)

# Write a function to calculate the reciprocal
get_reciprocal <- function(x) {
  1 / x
}

# 2. Escribe una función, `calc_harmonic_mean()`,
## que calcule la media armónica de su única entrada, `x`.

calc_harmonic_mean <- function(x) {
  x %>%
    get_reciprocal() %>%
    mean() %>%
    get_reciprocal()
}

# 3. Utilizando `std_and_poor500`,
## agrupa por `sector`, y resume para calcular la media armónica
## de las relaciones precio/ganancias en la columna `pe_ratio`.
# Write a function to calculate the harmonic mean

std_and_poor500 %>%
  # Group by sector
  group_by(sector) %>%
  # Summarize, calculating harmonic mean of P/E ratio
  summarize(hmean_pe_ratio = calc_harmonic_mean(pe_ratio))
