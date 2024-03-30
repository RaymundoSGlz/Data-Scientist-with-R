library(dplyr)
library(assertive)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")
get_reciprocal <- function(x) {
  1 / x
}

# Actualiza calc_harmonic_mean()
## para corregir el argumento na.rm utilizando use_first()
## para seleccionar el primer elemento na.rm,
## y coerce_to() para cambiarlo a lógico.

# Update the function definition to fix the na.rm argument
calc_harmonic_mean <- function(x, na.rm = FALSE) {
  assert_is_numeric(x)
  if (any(is_non_positive(x), na.rm = TRUE)) {
    stop("x contains non-positive values, so the harmonic mean makes no sense.")
  }
  # Use the first value of na.rm, and coerce to logical
  na.rm <- coerce_to(use_first(na.rm), target_class = "logical")
  x %>%
    get_reciprocal() %>%
    mean(na.rm = na.rm) %>%
    get_reciprocal()
}

# See what happens when you pass it malformed na.rm
calc_harmonic_mean(std_and_poor500$pe_ratio, na.rm = 1:5)
