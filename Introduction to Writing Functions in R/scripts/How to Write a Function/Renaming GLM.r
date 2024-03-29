library(dplyr)
snake_river_visits <- readRDS("data/snake_river_visits.rds")
snake_river_explanatory <- readRDS("data/snake_river_explanatory.rds")

# 1. Ejecuta una regresión lineal generalizada llamando a `glm()`.
## Modela `n_visits` vs. `gender`, `income`, y `travel` en el conjunto de datos
## `snake_river_visits`, estableciendo la `family` en `poisson`.

# Run a generalized linear regression
glm(
  # Model no. of visits vs. gender, income, travel
  n_visits ~ gender + income + travel,
  # Use the snake_river_visits dataset
  data = snake_river_visits,
  # Make it a Poisson regression
  family = "poisson"
)

# 2. Define una función, `run_poisson_regression()`,
## para ejecutar una regresión de Poisson.
## Esto debería tomar dos argumentos: `data` y `formula`, y llamar a `glm()`,
## pasando esos argumentos y estableciendo `family` en `poisson`.

# Write a function to run a Poisson regression
run_poisson_regression <- function(data, formula) {
  glm(formula, data, family = "poisson")
}

# 3. Recrea el modelo de regresión de Poisson del primer paso,
## esta vez llamando a tu función `run_poisson_regression()`.

# Re-run the Poisson regression, using your function
model <- snake_river_visits %>%
  run_poisson_regression(n_visits ~ gender + income + travel)

# Run this to see the predictions
snake_river_explanatory %>%
  mutate(predicted_n_visits = predict(model, ., type = "response")) %>%
  arrange(desc(predicted_n_visits))