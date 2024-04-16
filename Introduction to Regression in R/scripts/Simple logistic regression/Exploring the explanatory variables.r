library(fst)
library(ggplot2)
churn <- read_fst("data/churn.fst")

# 1. Usando `churn`, traza `time_since_last_purchase`
## como un histograma con binwidth `0.25` faceteado
## en una cuadrícula con `has_churned` en cada fila.

# Using churn, plot time_since_last_purchase
ggplot(churn, aes(x = time_since_last_purchase)) +
  # as a histogram with binwidth 0.25
  geom_histogram(binwidth = 0.25) +
  # faceted in a grid with has_churned on each row
  facet_grid(has_churned ~ .)

# 2. Redibuja el gráfico con `time_since_first_purchase`.
## Es decir, usando `churn`, traza `time_since_first_purchase`
## como un histograma con binwidth `0.25`
## faceteado en una cuadrícula con `has_churned` en cada fila.

# Redraw the plot with time_since_first_purchase
ggplot(churn, aes(x = time_since_first_purchase)) +
  # as a histogram with binwidth 0.25
  geom_histogram(binwidth = 0.25) +
  # faceted in a grid with has_churned on each row
  facet_grid(has_churned ~ .)
