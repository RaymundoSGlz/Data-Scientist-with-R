library(fst)
library(ggplot2)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# 1. Usando `taiwan_real_estate`, dibuja un gráfico de dispersión
## de `price_twd_msq` (eje y) versus `n_convenience` (eje x).

# Draw a scatter plot of n_convenience vs. price_twd_msq
ggplot(taiwan_real_estate, aes(x = n_convenience, y = price_twd_msq)) +
  geom_point()

# 2. Actualiza el gráfico para hacer los puntos 50% transparentes
## configurando `alpha` en `0.5`

# Make points 50% transparent
ggplot(taiwan_real_estate, aes(x = n_convenience, y = price_twd_msq)) +
  geom_point(alpha = 0.5)

# 3. Actualiza el gráfico agregando una línea de tendencia,
## calculada usando una regresión lineal.
## Puedes omitir el intervalo de confianza.

# Add a linear trend line without a confidence ribbon
ggplot(taiwan_real_estate, aes(x = n_convenience, y = price_twd_msq)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE)
