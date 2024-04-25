library(dplyr)
library(ggplot2)
library(fst)
auctions <- read_fst("data/auctions.fst")

# 1. Observa la estructura del conjunto de datos `auctions` y
## familiarízate con sus columnas.
#   - Ajusta un modelo de regresión lineal de `price` versus `openbid`,
## utilizando el conjunto de datos `auctions`. *Observa los coeficientes.*

# Take a glimpse at the dataset
glimpse(auctions)

# Model price vs. opening bid using auctions
mdl_price_vs_openbid <- lm(price ~ openbid, data = auctions)

# See the result
mdl_price_vs_openbid

# 2. Usando auctions, traza `price` versus `openbid` como un gráfico
## de dispersión con líneas de tendencia de regresión lineal (sin cinta).
## *Observa la línea de tendencia.*

# Using auctions, plot price vs. opening bid as a scatter plot
## with linear regression trend lines
ggplot(auctions, aes(x = openbid, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)