library(dplyr)
library(ggplot2)
library(yardstick)
library(fst)
churn <- read_fst("data/churn.fst")

mdl_churn_vs_both_inter <- glm(
  has_churned ~ time_since_first_purchase * time_since_last_purchase,
  data = churn,
  family = "binomial"
)

# 1. Obtén las respuestas actuales del conjunto de datos `churn`.
#   - Obtén las respuestas predichas de los valores ajustados redondeados de
## `mdl_churn_vs_both_inter`.
#   - Crea una tabla de los valores de respuesta reales y predichos.
#   - Convierte la tabla en un objeto de matriz de confusión `conf_mat`.

# Get the actual responses from churn
actual_response <- churn$has_churned

# Get the predicted responses from the model
predicted_response <- round(fitted(mdl_churn_vs_both_inter))

# Get a table of these values
outcomes <- table(predicted_response, actual_response)

# Convert the table to a conf_mat object
confusion <- conf_mat(outcomes)

# See the result
confusion

# 2. Traza "automáticamente" la matriz de confusión, `confusion`.
#   - Obtén las métricas resumidas de la matriz de confusión.
## Recuerda que el evento de abandono se encuentra en la segunda
## fila/columna de la matriz.

# "Automatically" plot the confusion matrix
autoplot(confusion)

# Get summary metrics
summary(confusion, event_level = "second")
