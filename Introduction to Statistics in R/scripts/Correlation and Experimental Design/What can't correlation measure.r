# Crear un diagrama de dispersión que muestre la relación
# entre gdp_per_cap (en el eje x) y life_exp (en el eje y).

# Importar librerías y datos
library(ggplot2)
library(dplyr)
world_happiness <- readRDS("data/world_happiness_sugar.rds")

# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness, aes(x = gdp_per_cap, y = life_exp)) +
    geom_point()

# Calcular la correlación entre gdp_per_cap y life_exp.

# Correlation between gdp_per_cap and life_exp
cor(world_happiness$gdp_per_cap, world_happiness$life_exp)
