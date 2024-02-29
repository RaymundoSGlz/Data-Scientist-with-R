library(stringdist)
library(dplyr)
library(fuzzyjoin)

zagat <- readRDS("data/zagat.rds")

cities <- data.frame(
  city_actual = c(
    "new york", "los angeles", "atlanta", "san francisco", "las vegas"
  )
)

# Cuenta el número de cada variación del nombre de `city` en `zagat`.
zagat %>%
  count(city)

# Haga un join a la izquierda entre zagat y cities basándose en la distancia
## de cadena utilizando las columnas city y city_actual.
# Seleccione las columnas name, city y city_actual.

# Join zagat and cities and look at results
zagat %>%
  # Left join based on stringdist using city and city_actual cols
  stringdist_left_join(cities, by = c("city" = "city_actual")) %>%
  # Select the name, city, and city_actual cols
  select(name, city, city_actual)