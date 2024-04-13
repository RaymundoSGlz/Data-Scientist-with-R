library(dplyr)
library(ggplot2)
library(ggfortify)
library(broom)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_dist <- lm(
  price_twd_msq ~ sqrt(dist_to_mrt_m),
  data = taiwan_real_estate
)

# 1. Aumenta `mdl_price_vs_dist`,
## luego ordena las observaciones por influencia descendente (`.hat`),
## y obtén el inicio de los resultados.

mdl_price_vs_dist %>%
  # Augment the model
  augment() %>%
  # Arrange rows by descending leverage
  arrange(desc(.hat)) %>%
  # Get the head of the dataset
  head()

# 2. Aumenta `mdl_price_vs_dist`,
## luego ordena las observaciones por influencia descendente (`.cooksd`),
## y obtén el inicio de los resultados.

mdl_price_vs_dist %>%
  # Augment the model
  augment() %>%
  # Arrange rows by descending Cook's distance
  arrange(desc(.cooksd)) %>%
  # Get the head of the dataset
  head()

# 3. Dibuja los tres gráficos de diagnóstico de valores atípicos
## (numerados `4` a `6`) para `mdl_price_vs_dist`.
## Usa un diseño de tres filas y una columna.

# Plot the three outlier diagnostics for mdl_price_vs_dist
autoplot(
  mdl_price_vs_dist,
  which = 4:6,
  ncol = 1,
  nrow = 3
)
