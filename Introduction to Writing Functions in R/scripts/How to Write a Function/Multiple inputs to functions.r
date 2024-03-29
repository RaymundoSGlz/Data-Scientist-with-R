# 1. Sesga la moneda ponderando el muestreo.
## Especifica el argumento `prob` de tal manera que las caras
## sean muestreadas con la probabilidad `p_head`
## (y las colas sean muestreadas con la probabilidad `1 - p_head`).

coin_sides <- c("head", "tail")
n_flips <- 10
p_head <- 0.8

# Define a vector of weights
weights <- c(p_head, 1 - p_head)

# Update so that heads are sampled with prob p_head
sample(coin_sides, n_flips, replace = TRUE, prob = weights)

# 2. Actualiza la definición de `toss_coin()` para que acepte un argumento,
## `p_head`, y pese las muestras utilizando el código que escribiste
## en el paso anterior.
## Genera 10 lanzamientos de moneda con un 80% de probabilidad de cada cara.

# Update the function so heads have probability p_head
toss_coin <- function(n_flips, p_head) {
  coin_sides <- c("head", "tail")
  # Define a vector of weights
  weights <- c(p_head, 1 - p_head)
  # Modify the sampling to be weighted
  sample(coin_sides, n_flips, replace = TRUE, prob = weights)
}

# Generate 10 coin tosses
toss_coin(10, 0.8)