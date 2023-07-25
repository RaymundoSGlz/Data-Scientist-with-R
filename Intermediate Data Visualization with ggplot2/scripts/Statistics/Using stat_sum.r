library(ggplot2)
library(carData)
library(dplyr)
# Creamos la columna year_group
Vocab <- Vocab |>
  mutate(year_group = case_when(
    year %in% 1974:1995 ~ "1974.1995",
    year %in% 1996:2016 ~ "1996.2016"
  ))
# 1. Ejecute el código para ver cómo el jittering
# y la transparencia resuelven la superposición.
# Reemplace los puntos con jittered
# con una estadística de suma, usando stat_sum ().

# Run this, look at the plot, then update it
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  # Replace this with a sum stat
  stat_sum(alpha = 0.25)

# 2. Modifique la estética de tamaño con la función de escala apropiada.
# Agregue una función scale_size() para establecer el rango de 1 a 10.

ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_sum() +
  # Add a size scale, from 1 to 10
  scale_size(range = c(1, 10))

# 3. Dentro de stat_sum (), establezca el tamaño en ..prop ..
# para que el tamaño del círculo represente
# la proporción de todo el conjunto de datos.

# Amend the stat to use proportion sizes
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_sum(aes(size = after_stat(prop)))

# 4. Actualice el gráfico para agrupar por education,
# de modo que el tamaño del círculo represente la proporción del grupo.

# Amend the plot to group by education
ggplot(Vocab, aes(x = education, y = vocabulary, group = education)) +
  stat_sum(aes(size = ..prop..))
