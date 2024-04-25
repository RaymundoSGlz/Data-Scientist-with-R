library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Ajusta una regresión lineal del precio de la casa versus `n_convenience`,
## la raíz cuadrada de `dist_to_mrt_m`, y `house_age_years`.
## No incluyas una intersección global, y no incluyas ninguna interacción.

# Model price vs. no. of conv. stores, sqrt dist. to MRT station & house age,
# no global intercept, no interactions
mdl_price_vs_all_no_inter <- lm(
  price_twd_msq ~ n_convenience + sqrt(dist_to_mrt_m) + house_age_years + 0,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_all_no_inter

# 2. Ajusta una regresión lineal del precio de la casa versus
## la raíz cuadrada de `dist_to_mrt_m`, `n_convenience`, y `house_age_years`.
## No incluyas una intersección global, pero sí incluye interacciones de dos
## y tres vías entre las variables explicativas.

# Model price vs. sqrt dist. to MRT station, no. of conv. stores & house age,
# no global intercept, 3-way interactions
mdl_price_vs_all_3_way_inter <- lm(
  price_twd_msq ~ n_convenience * sqrt(dist_to_mrt_m) * house_age_years + 0,
  data = taiwan_real_estate
)
# See the result
mdl_price_vs_all_3_way_inter

# 3. Ajusta una regresión lineal del precio de la casa versus
## la raíz cuadrada de `dist_to_mrt_m`, `n_convenience`, y `house_age_years`.
## No incluyas una intersección global,
## pero sí incluye interacciones de dos vías (no de tres vías)
## entre las variables explicativas.

# Model price vs. sqrt dist. to MRT station, no. of conv. stores & house age,
# no global intercept, 2-way interactions
mdl_price_vs_all_2_way_inter <- lm(
  price_twd_msq ~ (n_convenience + sqrt(dist_to_mrt_m) + house_age_years)^2 + 0,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_all_2_way_inter
