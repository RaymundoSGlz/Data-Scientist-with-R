library(dplyr)
library(fst)
library(ggplot2)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)
explanatory_data <- tibble(
  n_convenience = 0:10
)
prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(
      mdl_price_vs_conv, explanatory_data
    )
  )

# Extiende el código de trazado para incluir las predicciones
## de puntos en `prediction_data`. Colorea los puntos de amarillo.

# Add to the plot
ggplot(taiwan_real_estate, aes(n_convenience, price_twd_msq)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a point layer of prediction data, colored yellow
  geom_point(
    data = prediction_data,
    color = "yellow"
  )
