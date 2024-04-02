library(magrittr)

get_reciprocal <- function(x) {
  1 / x
}

acres_to_sq_yards <- function(acres) {
  sq_yards <- acres * 4840
  return(sq_yards)
}

yards_to_meters <- function(yards) {
  meters <- yards * 0.9144
  return(meters)
}

sq_meters_to_hectares <- function(sq_meters) {
  hectares <- sq_meters / 10000
  return(hectares)
}

sq_yards_to_sq_meters <- function(sq_yards) {
  sq_yards %>%
    # Take the square root
    sqrt() %>%
    # Convert yards to meters
    yards_to_meters() %>%
    # Square it
    `^`(2)
}

acres_to_hectares <- function(acres) {
  acres %>%
    # Convert acres to sq. yards
    acres_to_sq_yards() %>%
    # Convert sq. yards to sq. meters
    sq_yards_to_sq_meters() %>%
    # Convert sq. meters to hectares
    sq_meters_to_hectares()
}

harmonic_acres_to_hectares <- function(acres) {
  acres %>%
    # Get the reciprocal
    get_reciprocal() %>%
    # Convert acres to hectares
    acres_to_hectares() %>%
    # Get the reciprocal again
    get_reciprocal()
}

# 1. Escribe una función para convertir masas en lb a kg.
## Esto debería tomar un solo argumento, `lbs`.

# Write a function to convert lb to kg
lbs_to_kgs <- function(lbs) {
  lbs %>%
    multiply_by(0.45359237)
}

# 2. Escribe una función para convertir masas en bushels a lbs.
## Esto debería tomar dos argumentos, `bushels` y `crop`.
## Debería definir un vector de búsqueda de factores de escala
## para cada cultivo (cebada, maíz, trigo),
## extraer el factor de escala para el cultivo,
## luego multiplicar esto por el número de bushels.

# Write a function to convert bushels to lbs
bushels_to_lbs <- function(bushels, crop) {
  # Define a lookup table of scale factors
  scale_factors <- c(barley = 48, corn = 56, wheat = 60)
  # Extract the value for the crop
  scale_factor <- scale_factors[crop]
  # Multiply by the no. of bushels
  bushels %>%
    multiply_by(scale_factor)
}

# 3. Escribe una función para convertir masas en bushels a kgs.
## Esto debería tomar dos argumentos, `bushels` y `crop`.
## Debería convertir la masa en bushels a lbs y luego a kgs.

# Write a function to convert bushels to kgs
bushels_to_kgs <- function(bushels, crop) {
  bushels %>%
    # Convert bushels to lbs for this crop
    bushels_to_lbs(crop) %>%
    # Convert lbs to kgs
    lbs_to_kgs()
}

# 4. Escribe una función para convertir rendimientos en bushels/acre a kg/ha.
## Los argumentos deberían ser `bushels_per_acre` y `crop`.
## Se deberían permitir tres opciones de `crop`:
## `"barley"`, `"corn"`, y `"wheat"`.
## Debería coincidir con el argumento `crop`,
## luego convertir bushels a kgs, luego convertir acres armónicos a hectáreas.

# Write a function to convert bushels/acre to kg/ha
bushels_per_acre_to_kgs_per_hectare <- function(bushels_per_acre, crop = c("barley", "corn", "wheat")) {
  # Match the crop argument
  crop <- match.arg(crop)
  bushels_per_acre %>%
    # Convert bushels to kgs for this crop
    bushels_to_kgs(crop) %>%
    # Convert harmonic acres to ha
    harmonic_acres_to_hectares()
}
