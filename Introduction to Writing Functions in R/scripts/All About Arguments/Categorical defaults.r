snake_river_visits <- readRDS("data/snake_river_visits.rds")
n_visits <- snake_river_visits$n_visits

# - Actualiza la firma de `cut_by_quantile()`
## para que el argumento `interval_type` pueda ser `"(lo, hi]"` o `"[lo, hi)"`.
## *Nota el espacio después de cada coma.*
# - Actualiza el cuerpo de `cut_by_quantile()`
## para que coincida con el argumento `interval_type`.
# - Elimina el argumento `interval_type` de la llamada a `cut_by_quantile()`.

# Set the categories for interval_type to "(lo, hi]" and "[lo, hi)"
cut_by_quantile <- function(x, n = 5, na.rm = FALSE, labels = NULL,
                            interval_type = c("(lo, hi]", "[lo, hi)")) {
  # Match the interval_type argument
  interval_type <- match.arg(interval_type, c("(lo, hi]", "[lo, hi)"))
  probs <- seq(0, 1, length.out = n + 1)
  qtiles <- quantile(x, probs, na.rm = na.rm, names = FALSE)
  right <- switch(interval_type,
    "(lo, hi]" = TRUE,
    "[lo, hi)" = FALSE
  )
  cut(x, qtiles, labels = labels, right = right, include.lowest = TRUE)
}

# Remove the interval_type argument from the call
cut_by_quantile(n_visits)
