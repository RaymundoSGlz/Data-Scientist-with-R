# Crear un gráfico de dispersión de gapminder_1952
# donde la población (pop) esté en el eje x
# y la esperanza de vida (lifeExp) esté en el eje y.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
gapminder_1952 |>
  ggplot(aes(x = pop, y = lifeExp)) +
  geom_point()
