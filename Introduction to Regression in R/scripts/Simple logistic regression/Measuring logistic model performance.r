library(yardstick)
library(ggplot2)
library(fst)
churn <- read_fst("data/churn.fst")
mdl_churn_vs_relationship <- glm(
  has_churned ~ time_since_first_purchase,
  data = churn,
  family = binomial
)
actual_response <- churn$has_churned
predicted_response <- round(fitted(mdl_churn_vs_relationship))
outcomes <- table(predicted_response, actual_response)
outcomes

# - Convierte `outcomes` en una matriz de confusión de yardstick.
## Asigna a `confusión`.
# - Traza automáticamente `confusión`.
# - Obtén métricas de rendimiento de `confusión`,
## recordando que la respuesta positiva está en la segunda columna.

# Convert outcomes to a yardstick confusion matrix
confusion <- conf_mat(outcomes)

# Plot the confusion matrix
autoplot(confusion)

# Get performance metrics for the confusion matrix
summary(confusion, event_level = "second")
