library(ggplot2)
library(carData)
library(dplyr)
# Creamos la columna year_group
Vocab <- Vocab |>
  mutate(year_group = case_when(
    year %in% 1974:1995 ~ "1974.1995",
    year %in% 1996:2016 ~ "1996.2016"
  ))
# 1. Acuatice el gráfico para agregar
# una estadística de regresión cuantil,
# en cuantiles 0.05, 0.5 y 0.95.

ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.25) +
  # Add a quantile stat, at 0.05, 0.5, and 0.95
  stat_quantile(
    aes(color = year_group),
    quantiles = c(0.05, 0.5, 0.95)
  )

# 2. Modifique el gráfico para colorear según year_group.

# Amend the plot to color by year_group
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  geom_jitter(alpha = 0.25) +
  stat_quantile(quantiles = c(0.05, 0.5, 0.95))
