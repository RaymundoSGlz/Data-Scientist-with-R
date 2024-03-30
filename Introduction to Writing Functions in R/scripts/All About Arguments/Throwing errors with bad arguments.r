library(dplyr)
library(assertive)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")
get_reciprocal <- function(x) {
  1 / x
}
# - Añade una línea al cuerpo de `calc_harmonic_mean()`
## para afirmar que `x` es numérico.
# - *Observa lo que sucede cuando pasas un argumento de carácter a
## `calc_harmonic_mean()`.*

calc_harmonic_mean <- function(x, na.rm = FALSE) {
  # Assert that x is numeric
  assert_is_numeric(x)
  x %>%
    get_reciprocal() %>%
    mean(na.rm = na.rm) %>%
    get_reciprocal()
}

# See what happens when you pass it strings
calc_harmonic_mean(std_and_poor500$sector)