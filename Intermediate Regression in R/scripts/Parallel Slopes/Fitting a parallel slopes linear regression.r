library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Utilizando el conjunto de datos `taiwan_real_estate`,
## modele el precio de la casa (en TWD por metro cuadrado)
## versus el número de tiendas de conveniencia cercanas.

# Fit a linear regr'n of price_twd_msq vs. n_convenience
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_conv

# 2. Modele el precio de la casa (en TWD por metro cuadrado)
## versus la antigüedad de la casa (en años).
## No incluya un término de intercepción.

# Fit a linear regr'n of price_twd_msq vs. house_age_years, no intercept
mdl_price_vs_age <- lm(
  price_twd_msq ~ house_age_years + 0,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_age

# 3. Modele el precio de la casa (en TWD por metro cuadrado) versus el número
## de tiendas de conveniencia cercanas más la antigüedad de la casa (en años).
## No incluya un término de intercepción.

# Fit a linear regr'n of price_twd_msq vs. n_convenience plus house_age_years,
# no intercept
mdl_price_vs_both <- lm(
  price_twd_msq ~ n_convenience + house_age_years + 0,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_both
