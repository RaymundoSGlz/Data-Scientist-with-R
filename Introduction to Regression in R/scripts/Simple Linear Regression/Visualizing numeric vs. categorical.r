library(fst)
library(ggplot2)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# - Utilizando `taiwan_real_estate`,
## traza un histograma de `price_twd_msq` con `10` bins.
# - Divide el gráfico por `house_age_years` para dar 3 paneles.

# Using taiwan_real_estate, plot price_twd_msq
ggplot(taiwan_real_estate, aes(x = price_twd_msq)) +
  # Make it a histogram with 10 bins
  geom_histogram(bins = 10) +
  # Facet the plot so each house age group gets its own panel
  facet_wrap(~ house_age_years)