library(fst)
library(ggplot2)
library(ggfortify)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)

# Dibuja los tres gráficos de diagnóstico (numerados 1 a 3)
## para mdl_price_vs_conv.
## Usa una disposición de tres filas y una columna.

# Plot the three diagnostics for mdl_price_vs_conv
autoplot(
  mdl_price_vs_conv,
  which = 1:3,
  ncol = 1,
  nrow = 3
)