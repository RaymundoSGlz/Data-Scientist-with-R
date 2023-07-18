# Resumir para encontrar la población total,
# como una columna llamada total_pop,
# en cada combinación de región y estado,
# agrupados en ese orden.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(region, state, county, population)

counties_selected %>%
  # Group and summarize to find the total population
    group_by(region, state) %>%
    summarize(total_pop = sum(population)) %>%
# Notice the tibble is still grouped by region;
# use another summarize() step to calculate two new columns:
# the average state population in each region (average_pop)
# and the median state population in each region (median_pop).
    summarize(average_pop = mean(total_pop),
              median_pop = median(total_pop))
