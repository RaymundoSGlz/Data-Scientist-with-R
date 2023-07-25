library(ggplot2)
# 1. Usando o conjunto de dados msleep, grafique los valores en bruto
# de brainwt contra los valores de bodywt como un diagrama de dispersión.

# Produce a scatter plot of brainwt vs. bodywt
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  ggtitle("Raw Values")

# 2. Agregue las capas scale_x_log10 () y scale_y_log10 ()
# con valores predeterminados para transformar los datos antes de trazarlos.

# Add scale_*_*() functions
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  ggtitle("Scale_ functions")

# 3. Usar coord_trans() para aplicar una
# transformación "log10" a las escalas x e y.

# Perform a log10 coordinate system transformation
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10")
