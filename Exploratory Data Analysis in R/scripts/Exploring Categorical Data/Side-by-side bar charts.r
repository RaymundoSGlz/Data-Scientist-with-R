comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)

# - Carga el paquete `ggplot2`.
# - Crea un gráfico de barras lado a lado con `align` en el eje x y
## `gender` como el estético `fill`.
# - Crea otro gráfico de barras lado a lado con `gender` en el eje x y
## `align` como el estético `fill`.
## Rota las etiquetas del eje 90 grados para ayudar a la legibilidad.

# Load ggplot2
library(ggplot2)

# Create side-by-side bar chart of gender by alignment
ggplot(comics, aes(x = align, fill = gender)) +
  geom_bar(position = "dodge")

# Create side-by-side bar chart of alignment by gender
ggplot(comics, aes(x = gender, fill = align)) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90))
