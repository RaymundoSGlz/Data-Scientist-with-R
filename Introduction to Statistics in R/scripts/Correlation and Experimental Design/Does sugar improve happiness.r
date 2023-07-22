# Crear un diagrama de dispersión que muestre
# la relación entre grams_sugar_per_day (en el eje x)
# y happiness_score (en el eje y).
# Calcular la correlación entre grams_sugar_per_day y happiness_score.

# Cargar librerías y datos
library(ggplot2)
library(dplyr)
world_happiness <- readRDS("data/world_happiness_sugar.rds")

# Scatterplot of grams_sugar_per_day and happiness_score
ggplot(world_happiness, aes(x = grams_sugar_per_day, y = happiness_score)) +
    geom_point()

# Correlation between grams_sugar_per_day and happiness_score
cor(world_happiness$grams_sugar_per_day, world_happiness$happiness_score)
