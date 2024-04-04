library(ggplot2)
comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)

# - Reordena los niveles de `align` usando la función `factor()`
## para que al imprimirlos se lea `"Bad"`, `"Neutral"`, luego `"Good"`.
# - Crea un gráfico de barras de recuentos de la variable `align`.

# Change the order of the levels in align
comics$align <- factor(comics$align,
  levels = c("Bad", "Neutral", "Good")
)

# Create plot of align
ggplot(comics, aes(x = align)) +
  geom_bar()
