library(ggplot2)
library(fst)
churn <- read_fst("data/churn.fst")

# - Usando el conjunto de datos `churn`, traza la recencia de la compra,
## `time_since_last_purchase`,
## frente a la duración de la relación con el cliente,
## `time_since_first_purchase`,
## coloreado por si el cliente se ha ido o no, `has_churned`.
# - Agrega una capa de puntos, con la transparencia establecida en `0.5`.
# - Usa un gradiente de 2 colores, con punto medio en `0.5`.
# - Usa el tema en blanco y negro.

# Using churn, plot recency vs. length of relationship colored by churn status
ggplot(
  churn,
  aes(time_since_first_purchase, time_since_last_purchase, color = has_churned)
) +
  # Make it a scatter plot, with transparency 0.5
  geom_point(alpha = 0.5) +
  # Use a 2-color gradient split at 0.5
  scale_color_gradient2(midpoint = 0.5)
# Use the black and white theme
theme_bw()
