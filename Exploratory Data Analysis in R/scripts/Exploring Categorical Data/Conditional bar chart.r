library(ggplot2)
comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)

# Crea un gráfico de barras de align dividido por gender.

# Plot of alignment broken down by gender
ggplot(comics, aes(x = align)) +
  geom_bar() +
  facet_wrap(~gender)
