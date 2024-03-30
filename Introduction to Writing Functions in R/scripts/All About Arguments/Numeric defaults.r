snake_river_visits <- readRDS("data/snake_river_visits.rds")
n_visits <- snake_river_visits$n_visits

# - Actualiza la definición de `cut_by_quantile()`
## para que el argumento `n` predeterminado sea `5`.
# - Elimina el argumento `n` de la llamada a `cut_by_quantile()`.

# Set the default for n to 5
cut_by_quantile <- function(x, n = 5, na.rm, labels, interval_type) {
  probs <- seq(0, 1, length.out = n + 1)
  qtiles <- quantile(x, probs, na.rm = na.rm, names = FALSE)
  right <- switch(interval_type,
    "(lo, hi]" = TRUE,
    "[lo, hi)" = FALSE
  )
  cut(x, qtiles, labels = labels, right = right, include.lowest = TRUE)
}

# Remove the n argument from the call
cut_by_quantile(
  n_visits,
  na.rm = FALSE,
  labels = c("very low", "low", "medium", "high", "very high"),
  interval_type = "(lo, hi]"
)
