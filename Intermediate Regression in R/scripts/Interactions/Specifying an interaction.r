library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Ajusta una regresión lineal de `price_twd_msq` versus `n_convenience`
## y `house_age_years` y su interacción, utilizando la sintaxis de "tiempos"
## para generar implícitamente la interacción.

# Model price vs both with an interaction using "times" syntax
lm(price_twd_msq ~ n_convenience * house_age_years, data = taiwan_real_estate)

# 2. Ajusta una regresión lineal de `price_twd_msq` versus `n_convenience`
## y `house_age_years` y su interacción, utilizando la sintaxis de "dos puntos"
## para generar explícitamente la interacción.

# Model price vs both with an interaction using "colon" syntax
lm(
  price_twd_msq ~
    n_convenience + house_age_years + n_convenience:house_age_years,
  data = taiwan_real_estate
)
