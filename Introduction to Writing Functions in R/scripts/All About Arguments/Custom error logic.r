library(dplyr)
library(assertive)
std_and_poor500 <- readRDS("data/std_and_poor500_with_pe_2019-06-21.rds")
get_reciprocal <- function(x) {
  1 / x
}
# - Si cualquier valor de `x` es no positivo (ignorando `NA`s)
## entonces lanza un error.
# - *Mira lo que sucede cuando pasas un argumento de carácter a
## `calc_harmonic_mean()`.*

calc_harmonic_mean <- function(x, na.rm = FALSE) {
  assert_is_numeric(x)
  # Check if any values of x are non-positive
  if(any(is_non_positive(x), na.rm = TRUE)) {
    # Throw an error
    stop("x contains non-positive values, so the harmonic mean makes no sense.")
  }
  x %>%
    get_reciprocal() %>%
    mean(na.rm = na.rm) %>%
    get_reciprocal()
}

# See what happens when you pass it negative numbers
calc_harmonic_mean(std_and_poor500$pe_ratio - 20)