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
# 1, Crear un gráfico de barras lado a lado ("dodged") de fcyl, lleno según fam.

# Plot fcyl bars, filled by fam
ggplot(mtcars, aes(x = fcyl, fill = fam)) +
  # place bars side-by-side
  geom_bar(position = "dodge")

# 2, Para obtener barras horizontales, agregue una función coord_flip ().

ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = "dodge") +
  # Flip the x and y coordinates
  coord_flip()

# 3, Las barras parcialmente superpuestas son populares
# con "infoviz" en revistas.Actualice el argumento de posición
# para usar position_dodge() con un ancho de 0.5.

ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Set a dodge width of 0.5 for partially overlapping bars
  geom_bar(position = position_dodge(0.5)) +
  coord_flip()
