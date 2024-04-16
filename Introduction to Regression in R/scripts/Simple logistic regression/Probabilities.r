library(dplyr)
library(ggplot2)
library(fst)
churn <- read_fst("data/churn.fst")
mdl_churn_vs_relationship <- glm(
  formula = has_churned ~ time_since_first_purchase, family = binomial,
  data = churn
)
explanatory_data <- tibble(
  time_since_first_purchase = seq(-1.5, 4, 0.25)
)
plt_churn_vs_relationship <- churn %>%
  ggplot(aes(x = time_since_first_purchase, y = has_churned)) +
  geom_point() +
  geom_smooth(
    method = "glm", se = FALSE, method.args = list(family = "binomial")
  )

# 1. Use el modelo, `mdl_churn_vs_relationship`, y los datos explicativos,
## `explanatory_data`, para predecir la probabilidad de rotación.
## Asigne las predicciones a la columna `has_churned` de un marco de datos,
## `prediction_data`. *Recuerde establecer el tipo de predicción*.

# Make a data frame of predicted probabilities
prediction_data <- explanatory_data %>%
  mutate(
    has_churned = predict(
      object = mdl_churn_vs_relationship, newdata = explanatory_data,
      type = "response"
    )
  )

# See the result
prediction_data

# 2. Actualice la trama `plt_churn_vs_relationship`
## para agregar puntos de `prediction_data`,
## coloreados de amarillo con un tamaño de 2.

# Update the plot
plt_churn_vs_relationship +
  # Add points from prediction_data, colored yellow, size 2
  geom_point(
    data = prediction_data, aes(y = has_churned), color = "yellow", size = 2
  )