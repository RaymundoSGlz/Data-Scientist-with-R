# Crear un diagrama de dispersión de
# happiness_score vs. life_exp usando ggplot2.

# Agregue una línea de tendencia lineal al diagrama de dispersión,
# estableciendo se en FALSE.

# Cargamos las librerías necesarias y los datos
library(ggplot2)
library(dplyr)
world_happiness <- readRDS("data/world_happiness_sugar.rds")

# Create a scatterplot of happiness_score vs. life_exp
ggplot(world_happiness, aes(x = life_exp, y = happiness_score)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE)

# Calcular la correlación entre life_exp y happiness_score.

# Correlation between life_exp and happiness_score
cor(world_happiness$life_exp, world_happiness$happiness_score)
