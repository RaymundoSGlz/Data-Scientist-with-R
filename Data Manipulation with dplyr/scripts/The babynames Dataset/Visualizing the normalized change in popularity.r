# Filtrar la tabla names_normalized para limitarla
# a los tres nombres Steven, Thomas y Matthew.

# Cree un gráfico de líneas para visualizar
# fraction_max en el tiempo, coloreado por nombre.

# Cargamos el dataset desde el rds
library(readr)
library(dplyr)
library(ggplot2)
babynames <- read_rds("data//babynames.rds")

names_normalized <- babynames %>%
    group_by(name) %>%
    mutate(
        name_total = sum(number),
        name_max = max(number)
    ) %>%
    ungroup() %>%
    mutate(fraction_max = number / name_max)

names_filtered <- names_normalized %>%
    # Filter for the names Steven, Thomas, and Matthew
    filter(name %in% c("Steven", "Thomas", "Matthew"))
    # Visualize these names over time
ggplot(names_filtered, aes(x = year, y = fraction_max, color = name)) +
    geom_line()
