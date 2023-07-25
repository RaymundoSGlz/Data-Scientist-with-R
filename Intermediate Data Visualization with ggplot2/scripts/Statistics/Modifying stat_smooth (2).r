library(ggplot2)
library(carData)
library(dplyr)
# Creamos la columna year_group
Vocab <- Vocab |>
  mutate(year_group = case_when(
    year %in% 1974:1995 ~ "1974.1995",
    year %in% 1996:2016 ~ "1996.2016"
  ))
# 1. Usando Vocab, grafique vocabulary vs. education, coloreado por year_group.
# Usar geom_jitter() para agregar puntos con transparencia 0.25.
# Agregue una estadística de regresión lineal suave
# (con la cinta de error estándar).

# Using Vocab, plot vocabulary vs. education, colored by year group
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  # Add jittered points with transparency 0.25
  geom_jitter(alpha = 0.25) +
  # Add a smooth lin. reg. line (with ribbon)
  stat_smooth(method = "lm")

# 2. Es más fácil leer el gráfico si las cintas de error estándar
# coinciden con las líneas y las líneas tienen más énfasis.
# Actualice la estadística suave.
# Asignar el color de relleno a year_group.
# Establezca el tamaño de línea en 2.

# Amend the plot
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  geom_jitter(alpha = 0.25) +
  # Map the fill color to year_group, set the line size to 2
  stat_smooth(aes(fill = year_group), method = "lm", size = 2)
