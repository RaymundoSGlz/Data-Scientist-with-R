library(dplyr)
library(ggplot2)
library(fst)
auctions <- read_fst("data/auctions.fst")

# 1. Ajusta un modelo de regresión lineal de `price` versus `openbid`
## y `auction_type`, con una interacción,
## utilizando el conjunto de datos `auctions`. *Mira los coeficientes.*

# Fit linear regression of price vs. opening bid and auction type,
## with an interaction.
mdl_price_vs_both <- lm(price ~ openbid * auction_type, data = auctions)

# See the result
mdl_price_vs_both

# 2. Usando `auctions`, traza `price` versus `openbid`,
## coloreado por `auction_type`,
## como un gráfico de dispersión con líneas de tendencia de regresión lineal
## (sin cinta). *Mira las líneas de tendencia.*

# Using auctions, plot price vs. opening bid colored by auction
## type as a scatter plot with linear regr'n trend lines
ggplot(auctions, aes(x = openbid, y = price, color = auction_type)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
