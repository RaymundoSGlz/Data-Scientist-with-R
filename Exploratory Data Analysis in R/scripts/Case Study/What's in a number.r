library(openintro)
library(ggplot2)

# - Reordena los niveles de `number` para que conserven el orden natural
## de `"none"`, luego `"small"`, luego `"big"`,
## guardando en una columna `number_reordered`.
# - Construye un gráfico de barras facetado
## de la asociación entre `number` y `spam`.

# Reorder levels
email$number_reordered <- factor(email$number,
  levels = c("none", "small", "big")
)

# Construct plot of number_reordered
ggplot(email, aes(x = number_reordered, fill = spam)) +
  geom_bar() +
  facet_wrap(~ spam)
