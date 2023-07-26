library(ggplot2)
library(dplyr)
mtcars_by_cyl <- mtcars %>%
  group_by(cyl) %>%
  summarize(
    mean_wt = mean(wt),
    sd_wt = sd(wt),
    n_wt = n()
  ) %>%
  mutate(prop = n_wt / sum(n_wt))

# Dibuja un gráfico de barras con geom_bar().
# Usando mtcars_by_cyl, traza mean_wt versus cyl.
# Agrega una capa de barra,
# con stat establecido en "identity" y color de relleno "skyblue".

# Using mtcars_cyl, plot mean_wt vs. cyl
ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  # Add a bar layer with identity stat, filled skyblue
  geom_bar(stat = "identity", fill = "skyblue")

# Graficar el mismo gráfico con geom_col().
# Reemplaza geom_bar() con geom_col().
# Elimina el argumento stat.

ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  # Swap geom_bar() for geom_col()
  geom_col(fill = "skyblue")

# Cambiar el ancho de las barras
# para reflejar la proporción de datos que contienen.
# Agrega un ancho estético a geom_col(),
# establecido en prop. (Ignora la advertencia de ggplot2.)

ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  # Set the width aesthetic to prop
  geom_col(aes(width = prop), fill = "skyblue")

# Agregar geom_errorbar().
# Establece el estético ymin en mean_wt menos sd_wt.
# Establece el estético ymax en el peso medio más
# la desviación estándar del peso.
# Establece width en 0.1.


ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  geom_col(aes(width = prop), fill = "skyblue") +
  # Add an errorbar layer
  geom_errorbar(
    # ... at mean weight plus or minus 1 std dev
    aes(ymin = mean_wt - sd_wt, ymax = mean_wt + sd_wt), ,
    # with width 0.1
    width = 0.1,
  )
