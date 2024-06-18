library(tidyr)
library(dplyr)
library(ggplot2)

# 1. Expande una cuadrícula que representa 5 dados de 8 lados.
## Es decir, crea un tibble con cinco columnas, llamadas die1 a die5.
## Las filas deben contener todas las posibilidades para lanzar cinco dados,
## cada uno numerado del 1 al 8.

# Expand a grid representing 5 8-sided dice
dice <- expand_grid(
  die1 = 1:8,
  die2 = 1:8,
  die3 = 1:8,
  die4 = 1:8,
  die5 = 1:8
)

# See the result
dice

# 2. Agrega una columna, mean_roll, a dice,
## que contenga la media de las cinco tiradas.

dice <- expand_grid(
  die1 = 1:8,
  die2 = 1:8,
  die3 = 1:8,
  die4 = 1:8,
  die5 = 1:8
) %>%
  # Add a column of mean rolls
  mutate(
    mean_roll = (die1 + die2 + die3 + die4 + die5) / 5
  )

# 3. Usando el conjunto de datos dice, gráfica mean_roll,
## convertido a un factor, como un gráfico de barras.

# Using dice, draw a bar plot of mean_roll as a factor
ggplot(dice, aes(factor(mean_roll))) +
  geom_bar()
