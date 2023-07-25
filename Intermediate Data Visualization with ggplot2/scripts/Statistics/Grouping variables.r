library(ggplot2)
# 1. Usando mtcars, dibuja un gráfico de dispersión de mpg vs. wt,
# coloreado por fcyl.
# Agrega una capa de punto.
# Agrega una estadística suave usando un modelo lineal y no mostrar la cinta se.

# Using mtcars, plot mpg vs. wt, colored by fcyl
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  # Add a point layer
  geom_point() +
  # Add a smooth lin reg stat, no ribbon
  stat_smooth(method = "lm", se = FALSE)

# 2. Actualiza el gráfico para agregar una segunda estadística suave.
# Agrega una estética de grupo ficticio a esta capa,
# estableciendo el valor en 1.
# Usa los mismos valores method y se que la primera capa de estadísticas suaves.

# Amend the plot to add another smooth layer with dummy grouping
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  # Add another smooth layer with dummy grouping
  stat_smooth(aes(group = 1), method = "lm", se = FALSE)
