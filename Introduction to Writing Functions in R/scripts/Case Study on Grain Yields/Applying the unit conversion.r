library(dplyr)
corn <- readRDS("data/nass.corn.rds")
wheat <- readRDS("data/nass.wheat.rds")
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

lbs_to_kgs <- function(lbs) {
  lbs %>%
    multiply_by(0.45359237)
}

bushels_to_lbs <- function(bushels, crop) {
  # Define a lookup table of scale factors
  scale_factors <- c(barley = 48, corn = 56, wheat = 60)
  # Extract the value for the crop
  scale_factor <- scale_factors[crop]
  # Multiply by the no. of bushels
  bushels %>%
    multiply_by(scale_factor)
}

bushels_to_kgs <- function(bushels, crop) {
  bushels %>%
    # Convert bushels to lbs for this crop
    bushels_to_lbs(crop) %>%
    # Convert lbs to kgs
    lbs_to_kgs()
}

bushels_per_acre_to_kgs_per_hectare <- function(bushels_per_acre, crop = c("barley", "corn", "wheat")) {
  # Match the crop argument
  crop <- match.arg(crop)
  bushels_per_acre %>%
    # Convert bushels to kgs for this crop
    bushels_to_kgs(crop) %>%
    # Convert harmonic acres to ha
    harmonic_acres_to_hectares()
}

# 1. *Mira el conjunto de datos `corn`.* Agrega dos columnas:
## `farmed_area_ha` debe ser `farmed_area_acres` convertido a hectáreas;
## `yield_kg_per_ha` debe ser `yield_bushels_per_acre`
## convertido a kilogramos por hectárea.

# View the corn dataset
glimpse(corn)

corn %>%
  # Add some columns
  mutate(
    # Convert farmed area from acres to ha
    farmed_area_ha = acres_to_hectares(farmed_area_acres),
    # Convert yield from bushels/acre to kg/ha
    yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
      yield_bushels_per_acre,
      crop = "corn"
    )
  )

# 2. Envuelve el código de mutación en una función llamada
## `fortify_with_metric_units` que toma dos argumentos, `data` y `crop`
## sin valores predeterminados.
## (En el cuerpo de la función, intercambia `corn` por el argumento `data`
## y pasa la variable local `crop` de la función al argumento `crop`.)
## Utiliza `fortify_with_metric_units()` en el conjunto de datos `wheat`.

# Wrap this code in a function
fortify_with_metric_units <- function(data, crop) {
  data %>%
    mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
        yield_bushels_per_acre,
        crop = crop
      )
    )
}

# Try it on the wheat dataset
wheat %>%
  fortify_with_metric_units("wheat")