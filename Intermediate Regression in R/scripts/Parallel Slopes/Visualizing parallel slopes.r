library(ggplot2)
library(moderndive)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# - Utilizando el conjunto de datos `taiwan_real_estate`, traza
# los precios de las casas frente al número de tiendas de conveniencia cercanas,
# coloreadas por la edad de la casa.
# - Hazlo un gráfico de dispersión.
# - Añade pendientes paralelas, sin una banda de error estándar.

# Using taiwan_real_estate, plot price_twd_msq vs. n_convenience
## colored by house_age_years
taiwan_real_estate %>%
  ggplot(aes(n_convenience, price_twd_msq, color = house_age_years)) +
  # Add a point layer
  geom_point() +
  # Add parallel slopes, no ribbon
  geom_parallel_slopes(se = FALSE)
