library(fst)
churn <- read_fst("data/churn.fst")
mdl_churn_vs_relationship <- glm(
  formula = has_churned ~ time_since_first_purchase, family = binomial,
  data = churn
)

# - Obtén las respuestas reales
## de la columna `has_churned` del conjunto de datos.
## Asigna a `actual_response`.
# - Obtén las respuestas predichas "más probables" del modelo.
## Asigna a `predicted_response`.
# - Crea una tabla de recuentos
## a partir de los vectores de respuesta real y predicha.
## Asigna a `outcomes`.

# Get the actual responses from the dataset
actual_response <- churn$has_churned

# Get the "most likely" responses from the model
predicted_response <- round(fitted(mdl_churn_vs_relationship))

# Create a table of counts
outcomes <- table(predicted_response, actual_response)

# See the result
outcomes
