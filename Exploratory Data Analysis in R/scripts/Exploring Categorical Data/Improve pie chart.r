library(readr)
library(ggplot2)
pies <- read_csv("data/pies.csv")

# - Usa el código proporcionado para reordenar los niveles de `flavor`
## de modo que estén en orden descendente por conteo.
# - Crea un gráfico de barras de `flavor` y orienta las etiquetas verticalmente
## para que sean más fáciles de leer.
## El colorido por defecto puede parecer soso en comparación,
## así que cambia el `fill` de las barras a `"chartreuse"`.

# Put levels of flavor in descending order
lev <- c(
  "apple",
  "key lime",
  "boston creme",
  "blueberry",
  "cherry",
  "pumpkin",
  "strawberry"
)
pies$flavor <- factor(pies$flavor, levels = lev)

# Create bar chart of flavor
ggplot(pies, aes(x = flavor)) +
  geom_bar(fill = "chartreuse") +
  theme(axis.text.x = element_text(angle = 90))
