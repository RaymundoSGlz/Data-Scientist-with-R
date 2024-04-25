library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# - Usando el conjunto de datos `taiwan_real_estate`,
## dibuja un gráfico de dispersión de `n_convenience`
## versus la raíz cuadrada de `dist_to_mrt_m`, coloreado por `price_twd_msq`.
# - Usa la escala de color plasma viridis continua.
# - Faceta la gráfica, envolviendo por `house_age_years`.

# Using taiwan_real_estate, no. of conv. stores vs. sqrt of dist. to MRT,
## colored by plot house price
ggplot(
  taiwan_real_estate,
  aes(sqrt(dist_to_mrt_m), n_convenience, color = price_twd_msq)
) +
  # Make it a scatter plot
  geom_point() +
  # Use the continuous viridis plasma color scale
  scale_color_viridis_c(option = "plasma") +
  # Facet, wrapped by house age
  facet_wrap(~house_age_years)
