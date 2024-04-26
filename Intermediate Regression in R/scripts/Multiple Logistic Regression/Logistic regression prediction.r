library(dplyr)
library(tidyr)
library(ggplot2)
library(fst)
churn <- read_fst("data/churn.fst")

mdl_churn_vs_both_inter <- glm(
  has_churned ~ time_since_first_purchase * time_since_last_purchase,
  data = churn,
  family = "binomial"
)

# 1. Crea una cuadrícula de variables explicativas.
#   - Establece `time_since_first_purchase`
## en una secuencia de menos dos a cuatro en pasos de `0.1`.
#   - Establece `time_since_last_purchase`
## en una secuencia de menos uno a seis en pasos de `0.1`.

# Make a grid of explanatory data
explanatory_data <- expand_grid(
  # Set len. relationship to seq from -2 to 4 in steps of 0.1
  time_since_first_purchase = seq(-2, 4, 0.1),
  # Set recency to seq from -1 to 6 in steps of 0.1
  time_since_last_purchase = seq(-1, 6, 0.1)
)

# See the result
explanatory_data

# 2. Agrega una columna a `explanatory_data` llamada `has_churned`
## que contenga predicciones utilizando `mdl_churn_vs_both_inter` y
## `explanatory_data` con tipo `"response"`.

# Add a column of predictions using mdl_churn_vs_both_inter and
# explanatory_data with type response
prediction_data <- explanatory_data %>%
  mutate(
    has_churned = predict(
      mdl_churn_vs_both_inter, explanatory_data,
      type = "response"
    )
  )

# See the result
prediction_data

# 3. Amplía el gráfico agregando puntos de `prediction_data`
## con tamaño 3 y forma 15.

# Extend the plot
ggplot(
  churn,
  aes(time_since_first_purchase, time_since_last_purchase, color = has_churned)
) +
  geom_point(alpha = 0.5) +
  scale_color_gradient2(midpoint = 0.5) +
  theme_bw() +
  # Add points from prediction_data with size 3 and shape 15
  geom_point(
    data = prediction_data,
    size = 3, shape = 15
  )
