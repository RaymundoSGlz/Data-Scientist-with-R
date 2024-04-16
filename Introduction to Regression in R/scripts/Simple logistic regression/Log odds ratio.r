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

# 1. Actualiza `prediction_data` para agregar
## la relación de probabilidades logarítmicas calculada de dos maneras.
## Calcúlala a partir de `odds_ratio`, luego directamente usando `predict()`.

# Update the data frame
prediction_data <- explanatory_data %>%
  mutate(
    has_churned = predict(
      mdl_churn_vs_relationship, explanatory_data,
      type = "response"
    ),
    odds_ratio = has_churned / (1 - has_churned),
    # Add the log odds ratio from odds_ratio
    log_odds_ratio = log(odds_ratio),
    # Add the log odds ratio using predict()
    log_odds_ratio2 = predict(mdl_churn_vs_relationship, explanatory_data)
  )

# See the result
prediction_data

# 2. Actualiza el gráfico para usar una escala y-logarítmica.

# Update the plot
ggplot(prediction_data, aes(time_since_first_purchase, odds_ratio)) +
  geom_line() +
  geom_hline(yintercept = 1, linetype = "dotted") +
  # Use a logarithmic y-scale
  scale_y_log10()
