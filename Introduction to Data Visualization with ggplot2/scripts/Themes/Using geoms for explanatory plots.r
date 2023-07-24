library(gapminder)
library(RColorBrewer)
library(ggplot2)
library(dplyr)
gm2007 <- gapminder %>%
    filter(year == 2007) %>%
    select(country, lifeExp, continent) %>%
    filter(lifeExp > 80.6 | lifeExp < 46) %>%
    arrange(lifeExp)
# geom_segment() agrega segmentos de línea y requiere dos estéticas adicionales:
# xend y yend. Para dibujar una línea horizontal para cada punto,
# mapee 30 en xend y country en yend.

# Add a geom_segment() layer
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2)

# geom_text() también necesita una estética adicional: label.
# Mapee lifeExp en label y establezca los atributos
# color en "white" y size en 1.5.

# Add a geom_text() layer
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2) +
    geom_text(aes(label = lifeExp), color = "white", size = 1.5)

# La escala de color se ha establecido para usted,
# pero debe limpiar las escalas. Para la escala x:
# Establezca expand en c(0, 0) y limits en c(30, 90).
# Coloque el eje en la parte superior del plot con el argumento position.

# Set the color scale
palette <- brewer.pal(5, "RdYlBu")[-(2:4)]

# Modify the scales
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2) +
    geom_text(aes(label = round(lifeExp, 1)), color = "white", size = 1.5) +
    scale_x_continuous("",
        expand = c(0, 0),
        limits = c(30, 90), position = "top"
    ) +
    scale_color_gradientn(colors = palette)

# Asegúrese de etiquetar el plot apropiadamente usando labs():
# Haga el título "Highest and lowest life expectancies, 2007".
# Agregue una referencia estableciendo caption en "Source: gapminder".
# Set the color scale
palette <- brewer.pal(5, "RdYlBu")[-(2:4)]

# Add a title and caption
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
    geom_point(size = 4) +
    geom_segment(aes(xend = 30, yend = country), size = 2) +
    geom_text(aes(label = round(lifeExp, 1)), color = "white", size = 1.5) +
    scale_x_continuous("",
        expand = c(0, 0),
        limits = c(30, 90), position = "top"
    ) +
    scale_color_gradientn(colors = palette) +
    labs(
        title = "Highest and lowest life expectancies, 2007",
        caption = "Source: gapminder"
    )
