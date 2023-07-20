# Crear dos data frames: uno que contenga las filas de food_consumption
# para "Belgium" y otro que contenga las filas para "USA".
# Llame a estos belgium_consumption y usa_consumption.
# Calcular la media y la mediana de kilogramos de alimentos
# consumidos por persona por año para ambos países.

# Filtrar food_consumption para las filas con datos sobre Bélgica y los EE. UU.
# Agrupar los datos filtrados por país.
# Calcular la media y la mediana de los kilogramos de alimentos
# consumidos por persona por año en cada país.
# Llame a estas columnas mean_consumption y median_consumption.

# Cargamos el dataset
library(readr)
library(dplyr)
food_consumption <- read_rds("data//food_consumption.rds")

# Filter for Belgium
belgium_consumption <- food_consumption %>%
  filter(country == "Belgium")

# Filter for USA
usa_consumption <- food_consumption %>%
  filter(country == "USA")

# Calculate mean and median consumption in Belgium
mean(belgium_consumption$consumption)
median(belgium_consumption$consumption)

# Calculate mean and median consumption in USA
mean(usa_consumption$consumption)
median(usa_consumption$consumption)

food_consumption %>%
  # Filter for Belgium and USA
  filter(country %in% c("Belgium", "USA")) %>%
  # Group by country
  group_by(country) %>%
  # Get mean_consumption and median_consumption
  summarize(
    mean_consumption = mean(consumption),
    median_consumption = median(consumption)
  )
