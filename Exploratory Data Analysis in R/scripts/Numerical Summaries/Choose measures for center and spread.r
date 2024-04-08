library(dplyr)
library(gapminder)
library(ggplot2)
gap2007 <- gapminder %>%
  filter(year == 2007)

# Usando las formas de los gráficos de densidad,
## calcula las medidas más apropiadas de centro y dispersión para lo siguiente:

# - La distribución de la expectativa de vida en los países de América.
## Nota que necesitarás aplicar un filtro aquí.
# - La distribución de la *población* de los países
## en todo el conjunto de datos `gap2007`.

# Compute stats for lifeExp in Americas
gap2007 %>%
  filter(continent == "Americas") %>%
  summarize(
    mean(lifeExp),
    sd(lifeExp)
  )

# Compute stats for population
gap2007 %>%
  summarize(
    median(pop),
    IQR(pop)
  )
