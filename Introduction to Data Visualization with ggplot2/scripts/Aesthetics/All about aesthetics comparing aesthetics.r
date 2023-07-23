library(ggplot2)
library(dplyr)
mtcars <- mtcars %>% mutate(fcyl = factor(cyl))
# 1. Usando mtcars, crear una capa base de trazado,
# plt_mpg_vs_wt. Mapear mpg en y y wt en x.
# Agregue una capa de puntos,
# mapeando el número categórico de cilindros, fcyl, en tamaño.

# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(x = wt, y = mpg))

# Map fcyl to size
plt_mpg_vs_wt +
    geom_point(aes(size = fcyl))

# 2. Cambiar el mapeo. Esta vez fcyl debe asignarse a alfa.

# Map fcyl to alpha, not size
plt_mpg_vs_wt +
    geom_point(aes(alpha = fcyl))

# 3. Cambiar el mapeo nuevamente. Esta vez fcyl debe asignarse a shape.

# Map fcyl to shape, not alpha
plt_mpg_vs_wt +
    geom_point(aes(shape = fcyl))

# 4. Intercambie la capa geom: cambie los puntos a texto.
# Cambie el mapeo nuevamente. Esta vez fcyl debe asignarse a etiqueta.

# Use text layer and map fcyl to label
plt_mpg_vs_wt +
    geom_text(aes(label = fcyl))
