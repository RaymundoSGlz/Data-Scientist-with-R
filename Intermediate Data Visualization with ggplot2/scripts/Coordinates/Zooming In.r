library(ggplot2)
library(dplyr)
fam <- c(
  "manual", "manual", "manual", "automatic", "automatic", "automatic",
  "automatic", "automatic", "automatic", "automatic", "automatic",
  "automatic", "automatic", "automatic", "automatic", "automatic",
  "automatic", "manual", "manual", "manual", "automatic",
  "automatic", "automatic", "automatic", "automatic", "manual",
  "manual", "manual", "manual", "manual", "manual", "manual"
)
mtcars <- mtcars %>%
  mutate(fam = factor(fam)) %>%
  mutate(fcyl = factor(cyl))
# Actualizar el gráfico agregando (+) una escala x continua
# con límites de 3 a 6.
# Spoiler: esto causará un problema!

# Run the code, view the plot, then update it
ggplot(mtcars, aes(x = wt, y = hp, color = fam)) +
  geom_point() +
  geom_smooth() +
  # Add a continuous x scale from 3 to 6
  scale_x_continuous(limits = c(3, 6))

# 2. Actualice el gráfico agregando
# un sistema de coordenadas cartesianas con límites x, xlim, de 3 a 6.

ggplot(mtcars, aes(x = wt, y = hp, color = fam)) +
  geom_point() +
  geom_smooth() +
  # Add Cartesian coordinates with x limits from 3 to 6
  coord_cartesian(xlim = c(3, 6))
