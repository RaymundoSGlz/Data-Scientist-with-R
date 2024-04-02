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

# 1. Escribe una función para convertir la distancia en yardas cuadradas
## a metros cuadrados. Debería tomar la raíz cuadrada de la entrada,
## luego convertir las yardas a metros, luego elevar al cuadrado el resultado.

# Write a function to convert sq. yards to sq. meters
sq_yards_to_sq_meters <- function(sq_yards) {
  sq_yards %>%
    # Take the square root
    sqrt() %>%
    # Convert yards to meters
    yards_to_meters() %>%
    # Square it
    `^`(2)
}

# 2. Escribe una función para convertir áreas en acres a hectáreas.
## La función debe convertir la entrada de acres a yardas cuadradas,
## luego a metros cuadrados, luego a hectáreas.

# Write a function to convert acres to hectares
acres_to_hectares <- function(acres) {
  acres %>%
    # Convert acres to sq. yards
    acres_to_sq_yards() %>%
    # Convert sq. yards to sq. meters
    sq_yards_to_sq_meters() %>%
    # Convert sq. meters to hectares
    sq_meters_to_hectares()
}

# 3. Escribe una función para convertir armónicamente áreas en acres
## a hectáreas. La función debería obtener el recíproco de la entrada,
## luego convertir de acres a hectáreas, luego obtener el recíproco de nuevo.

# Define a harmonic acres to hectares function
harmonic_acres_to_hectares <- function(acres) {
  acres %>%
    # Get the reciprocal
    get_reciprocal() %>%
    # Convert acres to hectares
    acres_to_hectares() %>%
    # Get the reciprocal again
    get_reciprocal()
}