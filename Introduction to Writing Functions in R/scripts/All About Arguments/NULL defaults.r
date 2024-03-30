snake_river_visits <- readRDS("data/snake_river_visits.rds")
n_visits <- snake_river_visits$n_visits

# - Actualiza la definición de `cut_by_quantile()`
## para que el argumento `labels` tenga un valor predeterminado de `NULL`.
# - Elimina el argumento `labels` de la llamada a `cut_by_quantile()`.

# Set the default for labels to NULL
cut_by_quantile <- function(
    x, n = 5, na.rm = FALSE, labels = NULL, interval_type) {
  probs <- seq(0, 1, length.out = n + 1)
  qtiles <- quantile(x, probs, na.rm = na.rm, names = FALSE)
  right <- switch(interval_type,
    "(lo, hi]" = TRUE,
    "[lo, hi)" = FALSE
  )
  cut(x, qtiles, labels = labels, right = right, include.lowest = TRUE)
}

# Remove the labels argument from the call
cut_by_quantile(
  n_visits,
  interval_type = "(lo, hi]"
)
