library(ggplot2)
comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)

# - Crea un gráfico de barras apilado de *recuentos*
## de `gender` con `align` en el eje x.
# - Crea un gráfico de barras apilado de *proporciones*
## de `gender` con `align` en el eje x
## estableciendo el argumento `position` en `geom_bar()` igual a `"fill"`.

# Plot of gender by align
ggplot(comics, aes(x = align, fill = gender)) +
  geom_bar()

# Plot proportion of gender, conditional on align
ggplot(comics, aes(x = align, fill = gender)) +
  geom_bar(position = "fill") +
  ylab("proportion")
