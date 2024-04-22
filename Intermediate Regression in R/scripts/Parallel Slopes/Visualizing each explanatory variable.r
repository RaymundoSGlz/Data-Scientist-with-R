library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Usando el conjunto de datos `taiwan_real_estate`,
## traza el precio de la casa versus
## el número de tiendas de conveniencia cercanas.
#    - Hazlo un gráfico de dispersión.
#    - Añade una línea de tendencia de regresión lineal suave
##     sin cinta de error estándar.

# Using taiwan_real_estate, plot price_twd_msq vs. n_convenience
ggplot(taiwan_real_estate, aes(n_convenience, price_twd_msq)) +
  # Add a point layer
  geom_point() +
  # Add a smooth trend line using linear regr'n, no ribbon
  geom_smooth(method = "lm", se = FALSE)

# 2. Usando el conjunto de datos `taiwan_real_estate`,
## traza el precio de la casa versus la edad de la casa.
#    - Hazlo un gráfico de caja.

# Using taiwan_real_estate, plot price_twd_msq vs. house_age_years
ggplot(taiwan_real_estate, aes(house_age_years, price_twd_msq)) +
  # Add a box plot layer
  geom_boxplot()
