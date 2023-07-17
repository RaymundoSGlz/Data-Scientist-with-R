# Utilice el conjunto de datos gapminder_1952 para crear un histograma
# de la población del país (pop_by_mil) en el año 1952.
# Dentro de la geometría del histograma, establezca el número de bins en 50.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)
gapminder_1952 |>
  ggplot(aes(x = pop_by_mil)) +
  geom_histogram(bins = 50)
