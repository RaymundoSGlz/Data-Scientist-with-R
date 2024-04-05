library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")

# - Construye un diagrama de caja de `msrp`.
# - Excluye los 3-5 valores atípicos más grandes filtrando las filas
## para retener los coches que cuestan menos de $100,000.
## Guarda este conjunto de datos reducido como `cars_no_out`.
# - Construye un diagrama de caja similar de `msrp`
## utilizando este conjunto de datos reducido. Compara los dos gráficos.

# Construct box plot of msrp
cars %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()

# Exclude outliers from data
cars_no_out <- cars %>%
  filter(msrp < 100000)

# Construct box plot of msrp using the reduced dataset
cars_no_out %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()
