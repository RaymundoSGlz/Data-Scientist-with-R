library(tidyverse)
monarchs <- read_csv("data/monarchs.csv")
monarchs <- monarchs %>%
  mutate(reign = from %--% to)

# - Crear nuevas columnas para `duration` y `period`
## que conviertan `reign` en el objeto apropiado.
# - Examine las columnas `name`, `duration` y `period`.

# New columns for duration and period
monarchs <- monarchs %>%
  mutate(
    duration = as.duration(reign),
    period = as.period(reign)
  )

# Examine results
monarchs %>%
  select(name, duration, period)
