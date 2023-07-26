library(ggplot2)
library(carData)
# 1. Agregar una capa facet_wrap() y especificar:
# La variable year con un argumento usando la función vars().

ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Create facets, wrapping by year, using vars()
  facet_wrap(vars(year))

# 2. Agregar una capa facet_wrap() y especificar
# la variable year con una notación de fórmula (~).

ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Create facets, wrapping by year, using a formula
  facet_wrap(~year)

# 3. Agregar una capa facet_wrap() y especificar:
# Notación de fórmula como antes, y ncol establecido en 11.

ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Update the facet layout, using 11 columns
  facet_wrap(~year, ncol = 11)
