library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

x_actual <- taiwan_real_estate$n_convenience
y_actual <- taiwan_real_estate$price_twd_msq

# 1. Establezca la intersección en diez.
#   - Establezca la pendiente en uno.
#   - Calcule los valores y predichos
## como la intersección más la pendiente veces los valores x reales.
#   - Calcule las diferencias entre los valores y reales y predichos.
#   - Calcule la suma de cuadrados. Obtenga la suma de las diferencias
## en los valores y, elevando al cuadrado cada valor.

# Set the intercept to 10
intercept <- 10

# Set the slope to 1
slope <- 1

# Calculate the predicted y values
y_pred <- intercept + slope * x_actual

# Calculate the differences between actual and predicted
y_diff <- y_actual - y_pred

# Calculate the sum of squares
sum(y_diff^2)

# 2. Complete el cuerpo de la función.
#   - Obtenga la intersección del primer elemento de `coeffs`.
#   - Obtenga la pendiente del segundo elemento de `coeffs`.
#   - Calcule los valores y predichos
## como la intersección más la pendiente veces los valores x reales.
#   - Calcule las diferencias entre los valores y reales y predichos.
#   - Calcule la suma de cuadrados. Obtenga la suma de las diferencias
## en los valores y, elevando al cuadrado cada valor.

calc_sum_of_squares <- function(coeffs) {
  # Get the intercept coeff
  intercept <- coeffs[1]

  # Get the slope coeff
  slope <- coeffs[2]

  # Calculate the predicted y values
  y_pred <- intercept + slope * x_actual

  # Calculate the differences between actual and predicted
  y_diff <- y_actual - y_pred

  # Calculate the sum of squares
  sum(y_diff^2)
}

# 3. Optimice la métrica de suma de cuadrados.
#   - Llame a una función de optimización.
#   - Inicialmente suponga que la intersección es cero y la pendiente es cero
## pasando un vector de parámetros nombrado.
#   - Use `calc_sum_of_squares` como la función de optimización.

# Optimize the metric
optim(
  # Initially guess 0 intercept and 0 slope
  par = c(intercept = 0, slope = 0),
  # Use calc_sum_of_squares as the optimization fn
  fn = calc_sum_of_squares
)

# Compare the coefficients to those calculated by lm()
lm(price_twd_msq ~ n_convenience, data = taiwan_real_estate)
