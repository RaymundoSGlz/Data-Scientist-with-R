# 1. Simula un único lanzamiento de moneda usando `sample()`
## para muestrear una vez de `coin_sides`.

coin_sides <- c("head", "tail")

# Sample from coin_sides once
sample(coin_sides, 1)

# 2. Escribe una plantilla para tu función, nombrándola `toss_coin`.
## La función no debe tomar argumentos.
## Todavía no incluyas el cuerpo de la función.

# Write a template for your function, toss_coin()
toss_coin <- function() {
  # (Leave the contents of the body for later)
  # Add punctuation to finish the body
}

# 3. Copia tu script y pégalo en el cuerpo de la función

# Paste your script into the function body
toss_coin <- function() {
  coin_sides <- c("head", "tail")
  sample(coin_sides, 1)
}

# 4. Llama a tu función.

# Call your function
toss_coin()