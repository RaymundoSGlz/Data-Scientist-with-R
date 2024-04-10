library(openintro)
library(dplyr)
library(ggplot2)

# Comenzando con `email`,
## forma una cadena continua que enlace las siguientes tareas:

# - Crea una nueva variable llamada `has_image` que sea `TRUE`
## donde el número de imágenes sea mayor que cero y `FALSE` en caso contrario.
# - Crea un gráfico apropiado con `email`
## para visualizar la relación entre `has_image` y `spam`.

# Create plot of proportion of spam by image
email %>%
  mutate(has_image = image > 0) %>%
  ggplot(aes(x = has_image, fill = spam)) +
  geom_bar(position = "fill")
