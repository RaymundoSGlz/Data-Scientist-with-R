library(ggplot2)
sp500_yearly_returns <- readRDS("data/sp500_yearly_returns.rds")

# - Usando `sp500_yearly_returns`,
# dibuja un gráfico de dispersión de `return_2019` vs. `return_2018`.
# - Agrega una línea "A-B", de color `"verde"`, con tamaño `1`.
# - Agrega una línea de tendencia suave hecha con el método de regresión lineal,
## y sin cinta de error estándar.
# - Ajusta las coordenadas para que las distancias a lo largo de los ejes x e y
## parezcan iguales.

# Using sp500_yearly_returns, plot return_2019 vs. return_2018
ggplot(sp500_yearly_returns, aes(x = return_2018, y = return_2019)) +
  # Make it a scatter plot
  geom_point() +
  # Add a line at y = x, colored green, size 1
  geom_abline(color = "green", size = 1) +
  # Add a linear regression trend line, no std. error ribbon
  geom_smooth(method = "lm", se = FALSE) +
  # Fix the coordinate ratio
  coord_fixed()