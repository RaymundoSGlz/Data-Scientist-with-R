library(ggplot2)
library(dplyr)
mtcars <- mtcars %>%
  mutate(car = rownames(mtcars)) %>%
  mutate(car = factor(car))
# Crear un gráfico de dispersión de wt vs car usando el dataset mtcars.
# Vamos a voltear los ejes en el siguiente paso.
# plot wt vs car
ggplot(mtcars, aes(car, wt)) +
  # Add a point layer
  geom_point() +
  labs(x = "car", y = "weight")

# Seria mas fácil de leer si car estuviera mapeado en el eje y.
# Voltear las coordenadas. Note que las etiquetas también se voltean!
# Flip the axes to set car to the y axis
ggplot(mtcars, aes(car, wt)) +
  geom_point() +
  labs(x = "car", y = "weight") +
  coord_flip()
