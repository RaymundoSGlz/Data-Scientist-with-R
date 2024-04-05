library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")

# Al observar rápidamente `unique(cars$ncyl)`
## se ve que hay más niveles posibles de `ncyl` de lo que podrías pensar.
## Aquí, restringe tu atención a los niveles más comunes.

# - Filtra `cars` para incluir solo coches con 4, 6 u 8 cilindros
## y guarda el resultado como `common_cyl`.
## El operador `%in%` puede resultar útil aquí.
# - Crea box plots lado a lado de `city_mpg` separados por `ncyl`.
# - Crea gráficos de densidad superpuestos de `city_mpg` coloreados por `ncyl`.

# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl %in% c(4, 6, 8))

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)
