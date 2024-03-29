library(readr)
gold_medals <- read_rds("data/gold_medals.rds")
# - 1 La línea final calcula la mediana del número de medallas de oro
## que ganó cada país
# Reescribe la llamada a `median()`, siguiendo las mejores prácticas.

# Look at the gold medals data
gold_medals

# Note the arguments to median()
args(median)

# Rewrite this function call, following best practices
median(gold_medals, na.rm = TRUE)

# - 2 La línea final calcula el ranking de cada país
## por número de medallas de oro.
## Utiliza `gold_medals` negativas para que el país con más medallas
## tenga el 1er lugar: el valor positivo más grande en `gold_medals`
## es el valor más pequeño ("más negativo") en `-gold_medals`.
## Reescribe la llamada a `rank()`, siguiendo las mejores prácticas.

# Note the arguments to rank()
args(rank)

# Rewrite this function call, following best practices
rank(-gold_medals, na.last = "keep", ties.method = "min")