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

# 1. Actualiza `prediction_data` para agregar una columna,
## `odds_ratio`, de las razones de probabilidad.

# Update the data frame
prediction_data <- explanatory_data %>%
  mutate(
    has_churned = predict(
      mdl_churn_vs_relationship, explanatory_data,
      type = "response"
    ),
    # Add the odds ratio
    odds_ratio = has_churned / (1 - has_churned)
  )

# See the result
prediction_data

# 2. Utilizando `prediction_data`, dibuja un gráfico de líneas
## de `odds_ratio` versus `time_since_first_purchase`.
## Agrega una línea horizontal punteada en `odds_ratio` igual a `1`.

# Using prediction_data, plot odds_ratio vs. time_since_first_purchase
prediction_data %>%
  # Make it a line plot
  ggplot(aes(x = time_since_first_purchase, y = odds_ratio)) +
  geom_line() +
  # Add a dotted horizontal line at y = 1
  geom_hline(yintercept = 1, linetype = "dotted")