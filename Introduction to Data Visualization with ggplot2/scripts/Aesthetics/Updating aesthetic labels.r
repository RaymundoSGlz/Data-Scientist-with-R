library(ggplot2)
library(dplyr)

mtcars <- mtcars %>% mutate(fam = factor(am))
mtcars <- mtcars %>% mutate(fcyl = factor(cyl))
# 1. Establecer la etiqueta del eje x a "Number of Cylinders" y la etiqueta
# del eje y a "Count" usando los argumentos x e y de labs(), respectivamente.

ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  # Set the axis labels
  labs(
    x = "Number of Cylinders",
    y = "Count"
  )

# 2. Implementar una escala de color de relleno personalizada
# usando scale_fill_manual().
# Establezca el primer argumento en "Transmission" y los valores en palette.

palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  labs(x = "Number of Cylinders", y = "Count") +
  # Set the fill color scale
  scale_fill_manual("Transmission", values = palette)

# 3. Modifique el código para establecer la posición en dodge
# para que las barras de transmisión se muestren una al lado de la otra.

# Set the position
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = "dodge") +
  labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Transmission", values = palette)
