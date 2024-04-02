library(dplyr)
library(broom)
library(zeallot)
snake_river_visits <- readRDS("data/snake_river_visits.rds")
run_poisson_regression <- function(data, formula) {
  glm(formula, data, family = "poisson")
}
model <- snake_river_visits %>%
  run_poisson_regression(n_visits ~ gender + income + travel)

# 1. Examina la estructura de `model`.
## Utiliza las funciones de `broom` en `model` para crear una lista que contenga
## las partes del `model` a nivel de modelo, coeficiente y observación.

# Look at the structure of model (it's a mess!)
str(model)

# Use broom tools to get a list of 3 data frames
list(
  # Get model-level values
  model = glance(model),
  # Get coefficient-level values
  coefficients = tidy(model),
  # Get observation-level values
  observations = augment(model)
)

# 2. Envuelve el código en una función, `groom_model()`,
## que acepta `model` como su único argumento.

# Wrap this code into a function, groom_model
groom_model <- function(model) {
  list(
    model = glance(model),
    coefficients = tidy(model),
    observations = augment(model)
  )
}

# 3. Llama a `groom_model()` en `model`,
## asignando el resultado a tres variables a la vez: `mdl`, `cff` y `obs`.

# Call groom_model on model, assigning to 3 variables
c(mdl, cff, obs) %<-% groom_model(model)

# See these individual variables
mdl
cff
obs