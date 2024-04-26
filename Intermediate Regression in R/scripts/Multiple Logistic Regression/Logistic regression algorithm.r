library(fst)
churn <- read_fst("data/churn.fst")

x_actual <- churn$time_since_last_purchase
y_actual <- churn$has_churned

# 1. Establecer la intersección en uno.
#   - Establecer la pendiente en `0.5`.
#   - Calcular los valores y predichos
## como la intersección más la pendiente multiplicada por los valores x reales,
## todo transformado con la distribución logística de la CDF.
#   - Calcular la verosimilitud logarítmica para cada término
## como el logaritmo de los valores y predichos multiplicados
## por los valores y reales, más el logaritmo de uno menos los valores
## y predichos multiplicados por uno menos los valores y reales.
#   - Calcular menos la suma de las verosimilitudes logarítmicas
## para cada término.

# Set the intercept to 1
intercept <- 1

# Set the slope to 0.5
slope <- 0.5

# Calculate the predicted y values
y_pred <- plogis(intercept + slope * x_actual)

# Calculate the log-likelihood for each term
log_likelihoods <- y_actual * log(y_pred) + (1 - y_actual) * log(1 - y_pred)

# Calculate minus the sum of the log-likelihoods for each term
-sum(log_likelihoods)

# 2. Completar el cuerpo de la función.
#   - Obtener la intersección del primer elemento de `coeffs`.
#   - Obtener la pendiente del segundo elemento de `coeffs`.
#   - Calcular los valores y predichos como la intersección más
## la pendiente multiplicada por los valores x reales,
## transformada con la distribución logística de la CDF.
#   - Calcular la verosimilitud logarítmica para cada término
## como el logaritmo de los valores y predichos multiplicados
## por los valores y reales, más el logaritmo de uno menos los valores
## y predichos multiplicados por uno menos los valores y reales.
#   - Calcular menos la suma de las verosimilitudes logarítmicas
## para cada término.

calc_neg_log_likelihood <- function(coeffs) {
  # Get the intercept coeff
  intercept <- coeffs[1]

  # Get the slope coeff
  slope <- coeffs[2]

  # Calculate the predicted y values
  y_pred <- plogis(intercept + slope * x_actual)

  # Calculate the log-likelihood for each term
  log_likelihoods <- y_actual * log(y_pred) + (1 - y_actual) * log(1 - y_pred)

  # Calculate minus the sum of the log-likelihoods for each term
  -sum(log_likelihoods)
}

# 3. Optimizar la métrica de suma de cuadrados.
#   - Llamar a una función de optimización.
#   - Suponer inicialmente que la intersección es cero y la pendiente es uno.
#   - Usar `calc_neg_log_likelihood` como la función de optimización.

# Optimize the metric
optim(
  # Initially guess 0 intercept and 1 slope
  par = c(intercept = 0, slope = 1),
  # Use calc_neg_log_likelihood as the optimization fn
  fn = calc_neg_log_likelihood
)

# Compare the coefficients to those calculated by glm()
glm(has_churned ~ time_since_last_purchase, data = churn, family = binomial)
