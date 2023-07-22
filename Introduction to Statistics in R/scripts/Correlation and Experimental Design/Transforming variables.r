# Crear un diagrama de dispersión de happiness_score versus gdp_per_cap.
# Calcular la correlación entre happiness_score y gdp_per_cap.

# Cargar librerías y datos
library(ggplot2)
library(dplyr)
world_happiness <- readRDS("data/world_happiness_sugar.rds")

# Scatterplot of happiness_score vs. gdp_per_cap
ggplot(world_happiness, aes(x = gdp_per_cap, y = happiness_score)) +
    geom_point()

# Calculate correlation
cor(world_happiness$happiness_score, world_happiness$gdp_per_cap)

# Agregar una nueva columna a world_happiness llamada
# log_gdp_per_cap que contenga el logaritmo de gdp_per_cap.
# Crear un diagrama de dispersión de happiness_score versus log_gdp_per_cap.
# Calcular la correlación entre happiness_score y log_gdp_per_cap.

# Create log_gdp_per_cap column
world_happiness <- world_happiness %>%
    mutate(log_gdp_per_cap = log(gdp_per_cap))

# Scatterplot of happiness_score vs. log_gdp_per_cap
ggplot(world_happiness, aes(log_gdp_per_cap, happiness_score)) +
    geom_point()

# Calculate correlation
cor(world_happiness$log_gdp_per_cap, world_happiness$happiness_score)
