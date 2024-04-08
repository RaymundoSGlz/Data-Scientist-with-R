library(dplyr)
library(gapminder)
library(ggplot2)
gap2007 <- gapminder |>
  filter(year == 2007)

# El conjunto de datos `gap2007` que creaste en un ejercicio anterior
## está disponible en tu espacio de trabajo.

# - Para cada continente en `gap2007`,
## resuma las expectativas de vida utilizando `sd()`, `IQR()`,
## y el conteo de países, `n()`.
## No hay necesidad de nombrar las nuevas columnas producidas aquí.
## La función `n()` dentro de tu llamada `summarize()` no toma ningún argumento.
# - Compare gráficamente la dispersión de estas distribuciones
## construyendo gráficos de densidad superpuestos
## de la esperanza de vida desglosados por continente.

# Compute groupwise measures of spread
gap2007 %>%
  group_by(continent) %>%
  summarize(
    sd(lifeExp),
    IQR(lifeExp),
    n()
  )

# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_density(alpha = 0.3)
