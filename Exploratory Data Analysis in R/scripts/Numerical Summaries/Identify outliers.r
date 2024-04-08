library(dplyr)
library(gapminder)
library(ggplot2)
gap2007 <- gapminder |>
  filter(year == 2007)

# `gap2007` todavía está disponible en tu espacio de trabajo.

# - Aplica un filtro para que solo contenga observaciones de Asia,
## luego crea una nueva variable llamada `is_outlier` que es `TRUE`
## para países con expectativa de vida menor a 50.
## Asigna el resultado a `gap_asia`.
# - Filtra `gap_asia` para eliminar todos los valores atípicos,
## luego crea otro diagrama de caja de las expectativas de vida restantes.

# Filter for Asia, add column indicating outliers
gap_asia <- gap2007 %>%
  filter(continent == "Asia") %>%
  mutate(is_outlier = lifeExp < 50)

# Remove outliers, create box plot of lifeExp
gap_asia %>%
  filter(!is_outlier) %>%
  ggplot(aes(x = 1, y = lifeExp)) +
  geom_boxplot()