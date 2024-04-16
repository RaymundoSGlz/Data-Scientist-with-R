library(fst)
library(ggplot2)
churn <- read_fst("data/churn.fst")

# 1. Usando `churn` traza `has_churned` vs. `time_since_first_purchase`
## como un gráfico de dispersión,
## agregando una línea de tendencia de regresión lineal roja
## (sin una cinta de error estándar).

# Using churn plot has_churned vs. time_since_first_purchase
ggplot(churn, aes(x = time_since_first_purchase, y = has_churned)) +
  # Make it a scatter plot
  geom_point() +
  # Add an lm trend line, no std error ribbon, colored red
  geom_smooth(method = "lm", se = FALSE, color = "red")

# 2. Actualiza el gráfico agregando una segunda línea de tendencia
## de la regresión logística. (Sin cinta de error estándar nuevamente).

ggplot(churn, aes(time_since_first_purchase, has_churned)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  # Add a glm trend line, no std error ribbon, binomial family
  geom_smooth(method = "glm", se = FALSE, method.args = list(family = binomial))