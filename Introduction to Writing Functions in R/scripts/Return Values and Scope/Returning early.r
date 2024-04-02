library(assertive.numbers)
# Completa la definición de is_leap_year(),
## comprobando los casos de year siendo divisible por 400,
## luego 100, luego 4, regresando temprano de la función en cada caso.

is_leap_year <- function(year) {
  # If year is div. by 400 return TRUE
  if (is_divisible_by(year, 400)) {
    return(TRUE)
  }
  # If year is div. by 100 return FALSE
  if (is_divisible_by(year, 100)) {
    return(FALSE)
  }
  # If year is div. by 4 return TRUE
  if (is_divisible_by(year, 4)) {
    return(TRUE)
  }
  # Otherwise return FALSE
  return(FALSE)
}
