# Cargar el paquete ggplot2 después de los paquetes gapminder y dplyr.
# Filtrar gapminder para las observaciones del año 1952,
# y asignarlo a un nuevo conjunto de datos gapminder_1952
# utilizando el operador de asignación (<-).

# Load the ggplot2 package as well
library(gapminder)
library(dplyr)
library(ggplot2)


# Create gapminder_1952
gapminder_1952 <- gapminder |>
  filter(year == 1952)
