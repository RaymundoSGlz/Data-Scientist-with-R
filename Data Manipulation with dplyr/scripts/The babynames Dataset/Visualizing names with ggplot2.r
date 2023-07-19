# Filtrar solo los nombres Steven, Thomas y Matthew,
# y asignarlo a un objeto llamado selected_names.

# Visualizar esos tres nombres como un gráfico de líneas a lo largo del tiempo,
# con cada nombre representado por un color diferente.

# Cargamos el dataset
library(babynames)
library(dplyr)
library(ggplot2)

selected_names <- babynames %>%
    # Filter for the names Steven, Thomas, and Matthew
    filter(name %in% c("Steven", "Thomas", "Matthew"))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = n, color = name)) +
    geom_line()
