library(ggplot2)
library(dplyr)
library(gapminder)

gm2007_full <- gapminder %>%
    filter(year == 2007) %>%
    select(country, lifeExp, continent)
global_mean <- mean(gm2007_full$lifeExp)
x_start <- global_mean + 4
y_start <- 5.5
x_end <- global_mean
y_end <- 7.5

palette <- c("blue", "red", "green", "orange", "purple")

plt_country_vs_lifeExp <- ggplot(
    gm2007_full,
    aes(x = lifeExp, y = country, color = lifeExp)
) +
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

# Limpieza del tema
# Agregar un tema clásico al gráfico con theme_classic ().
# Establezca axis.line.y, axis.ticks.y y axis.title en element_blank ().
# Establecer el color de axis.text en "black".
# Eliminar la leyenda estableciendo legend.position en "none".

# Define the theme
plt_country_vs_lifeExp +
    theme_classic() +
    theme(
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = "black"),
        axis.title = element_blank(),
        legend.position = "none"
    )

# Usar geom_vline() para agregar una línea vertical.
# Establezca xintercept en global_mean,
# especifique el color en "grey40" y establezca linetype en 3.

# Add a vertical line
plt_country_vs_lifeExp +
    theme_classic() +
    theme(
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = "black"),
        axis.title = element_blank(),
        legend.position = "none"
    ) +
    geom_vline(xintercept = global_mean, color = "grey40", linetype = 3)

# x_start y y_start se utilizarán como posiciones para colocar el texto
# y se han calculado para usted.
# Agregue un "text" geom como una anotación.
# Para la anotación, establezca x en x_start,
# y en y_start y label en "The\nglobal\naverage".

# Add text
plt_country_vs_lifeExp +
    theme_classic() +
    theme(
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = "black"),
        axis.title = element_blank(),
        legend.position = "none"
    ) +
    geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
    annotate(
        "text",
        x = x_start, y = y_start,
        label = "The\nglobal\naverage",
        vjust = 1, size = 3, color = "grey40"
    )

# Anotar el gráfico con una flecha que conecte su texto con la línea.
# Use un "curve" geom.
# Establezca los extremos de la flecha xend en x_end e yend en y_end.
# Establezca la longitud de la punta de flecha en 0.2 cm y el tipo en "closed".

# Add a curve
plt_country_vs_lifeExp +
    step_1_themes +
    geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
    step_3_annotation +
    annotate(
        "curve",
        x = x_start, y = y_start,
        xend = x_end, yend = y_end,
        arrow = arrow(length = unit(0.2, "cm"), type = "closed"),
        color = "grey40"
    )
