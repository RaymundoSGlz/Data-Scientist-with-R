library(readr)
library(dplyr)
releases <- read_csv("data/rversions.csv")

# - Encuentra la fecha de la versión más reciente llamando a `max()`
## en la columna de fecha en `releases`.
# - Encuentra las filas en `releases` que tienen la fecha más reciente,
## especificando la comparación `date == last_release_date` en `filter()`
# - Imprime `last_release` para ver qué versión fue esta.
# - Calcula cuánto tiempo ha pasado desde la versión más reciente
## restando `last_release_date` de `Sys.Date()`.

# Find the largest date
last_release_date <- max(releases$date)

# Filter row for last release
last_release <- filter(releases, date == last_release_date)

# Print last_release
last_release

# How long since last release?
Sys.Date() - last_release_date