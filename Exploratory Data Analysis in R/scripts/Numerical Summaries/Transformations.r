library(dplyr)
library(gapminder)
library(ggplot2)
gap2007 <- gapminder |>
  filter(year == 2007)

# Usando los datos `gap2007`:

# - Crea un gráfico de densidad de la variable de población.
# - Mutar una nueva columna llamada `log_pop`
## que es el logaritmo natural de la población y guárdalo de nuevo en `gap2007`.
# - Crea un gráfico de densidad de tu variable transformada.

# Create density plot of old variable
gap2007 %>%
  ggplot(aes(x = pop)) +
  geom_density()

# Transform the skewed pop variable
gap2007 <- gap2007 %>%
  mutate(log_pop = log(pop))

# Create density plot of new variable
gap2007 %>%
  ggplot(aes(x = log_pop)) +
  geom_density()
