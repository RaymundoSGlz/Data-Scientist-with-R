# 1. Escribe una función, `acres_to_sq_yards()`,
## para convertir áreas en acres a áreas en yardas cuadradas.
## Esto debería tomar un solo argumento, `acres`.

# Write a function to convert acres to sq. yards
acres_to_sq_yards <- function(acres) {
  sq_yards <- acres * 4840
  return(sq_yards)
}

# 2. Escribe una función, `yards_to_meters()`,
## para convertir distancias en yardas a distancias en metros.
## Esto debería tomar un solo argumento, `yards`.

# Write a function to convert yards to meters
yards_to_meters <- function(yards) {
  meters <- yards * 0.9144
  return(meters)
}

# 3. Escribe una función, `sq_meters_to_hectares()`,
## para convertir áreas en metros cuadrados a áreas en hectáreas.
## Esto debería tomar un solo argumento, `sq_meters`.

# Write a function to convert sq. meters to hectares
sq_meters_to_hectares <- function(sq_meters) {
  hectares <- sq_meters / 10000
  return(hectares)
}