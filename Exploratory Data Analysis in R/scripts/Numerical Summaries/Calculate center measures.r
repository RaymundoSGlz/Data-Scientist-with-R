library(dplyr)
library(ggplot2)
library(gapminder)

# - Crea un conjunto de datos llamado `gap2007`
## que contenga solo datos del año 2007.
# - Usando `gap2007`, calcula la media y la mediana
## de la esperanza de vida para cada continente.
## No te preocupes por nombrar las nuevas columnas producidas por `summarize()`.
# - Confirma las tendencias que ves en las medianas generando gráficos
## de caja lado a lado de la esperanza de vida para cada continente.

# Create dataset of 2007 data
gap2007 <- filter(gapminder, year == 2007)

# Compute groupwise mean and median lifeExp
gap2007 %>%
  group_by(continent) %>%
  summarize(
    mean(lifeExp),
    median(lifeExp)
  )

# Generate box plots of lifeExp for each continent
gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()
