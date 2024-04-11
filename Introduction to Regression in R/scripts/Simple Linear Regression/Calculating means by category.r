library(fst)
library(dplyr)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# - Agrupa `taiwan_real_estate` por `house_age_years`.
# - Resumir para calcular la media `price_twd_msq` para cada grupo,
## nombrando la columna `mean_by_group`.
# - Asigna el resultado a `summary_stats` y *mira los números*.

summary_stats <- taiwan_real_estate %>%
  # Group by house age
  group_by(house_age_years) %>%
  # Summarize to calculate the mean house price/area
  summarize(mean_by_group = mean(price_twd_msq))

# See the result
summary_stats
