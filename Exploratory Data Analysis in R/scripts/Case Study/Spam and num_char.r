# Usando el conjunto de datos `email`

# - Carga los paquetes `ggplot2`, `dplyr` y `openintro`.
# - Calcula las medidas apropiadas del centro y la dispersión de `num_char`
## para ambos, spam y no spam, usando `group_by()` y `summarize()`.
## No es necesario nombrar las nuevas columnas creadas por `summarize()`.
# - Construye gráficos de caja lado a lado para visualizar
## la asociación entre las mismas dos variables.
## Será útil `mutate()` una nueva columna que contenga
## una versión logarítmicamente transformada de `num_char`.

# Load packages
library(ggplot2)
library(dplyr)
library(openintro)

# Compute summary statistics
email %>%
  group_by(spam) %>%
  summarize(
    median(num_char),
    IQR(num_char)
  )

# Create plot
email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam, y = log_num_char)) +
  geom_boxplot()
