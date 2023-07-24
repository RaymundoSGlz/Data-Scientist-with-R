load("data/recess.RData")
library(lubridate)
library(ggplot2)

plt_prop_unemployed_over_time <- ggplot(economics, aes(x = date, y = unemploy / pop)) +
    ggtitle(
        c("The percentage of unemployed Americans \n increases sharply during recessions")
    ) +
    geom_line() +
    geom_rect(
        data = recess,
        aes(
            xmin = begin, xmax = end,
            ymin = -Inf, ymax = +Inf, fill = "Recession"
        ),
        inherit.aes = FALSE, alpha = 0.2
    ) +
    geom_label(data = recess, aes(x = end, y = y, label = event), size = 3) +
    scale_fill_manual(name = "", values = "red", label = "Recessions")
# 1. Actualizar el gráfico para eliminar la leyenda.
# Observe los cambios en el gráfico.

# View the default plot
plt_prop_unemployed_over_time

# Remove legend entirely
plt_prop_unemployed_over_time + theme(legend.position = "none")

# 2. Actualizar el gráfico para colocar
# la leyenda en la parte inferior del gráfico.
# Observe los cambios en el gráfico.

# Position the legend at the bottom of the plot
plt_prop_unemployed_over_time +
    theme(legend.position = "bottom")

# 3. Posicione la leyenda dentro del gráfico,
# con la posición x 0.6 y la posición y 0.1.
# Observe los cambios en el gráfico.

# Position the legend inside the plot at (0.6, 0.1)
plt_prop_unemployed_over_time +
    theme(legend.position = c(0.6, 0.1))
