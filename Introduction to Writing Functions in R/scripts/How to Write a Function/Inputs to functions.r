# 1. Muestrea de `coin_sides` `n_flips` veces con reemplazo.

coin_sides <- c("head", "tail")
n_flips <- 10

# Sample from coin_sides n_flips times with replacement
sample(coin_sides, n_flips, replace = TRUE)

# 2. Actualiza la definición de `toss_coin()` para que acepte un solo argumento,
## `n_flips`.
## La función debería muestrear `coin_sides` `n_flips` veces con reemplazo.
## *Recuerda cambiar la firma y el cuerpo.*
## Genera 10 lanzamientos de moneda.

# Update the function to return n coin tosses
toss_coin <- function(n_flips) {
  coin_sides <- c("head", "tail")
  sample(coin_sides, n_flips, replace = TRUE)
}

# Generate 10 coin tosses
toss_coin(10)