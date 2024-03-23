library(lubridate)
library(readr)
library(dplyr)
releases <- read_csv("data/rversions.csv")

# `releases` ahora es un marco de datos con una columna llamada `datetime`
## con el tiempo de lanzamiento.

# - Primero, mira lo que hace `wday()` sin etiquetar,
# llamándolo en la columna `datetime` de `releases` y tabulando el resultado.
## *¿Sabes si `1` es domingo o lunes?*
# - Repite lo anterior, pero ahora usa etiquetas
## especificando el argumento `label`. *¿Mejor, verdad?*
# - Ahora almacena los días de la semana etiquetados
## en una nueva columna llamada `wday`.
# - Crea un gráfico de barras de lanzamientos por día de la semana,
## dividido por el tipo de lanzamiento.

library(ggplot2)

# Use wday() to tabulate release by day of the week
wday(releases$datetime) %>% table()

# Add label = TRUE to make table more readable
wday(releases$datetime, label = TRUE) %>% table()

# Create column wday to hold labelled week days
releases$wday <- wday(releases$datetime, label = TRUE)

# Plot barchart of weekday by type of release
ggplot(releases, aes(wday, fill = type)) +
  geom_bar() +
  facet_wrap(~type, ncol = 1, scale = "free_y")
