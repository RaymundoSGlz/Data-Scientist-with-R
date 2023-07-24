library(ggplot2)
plt_mpg_vs_wt_by_cyl <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
    ylab("Miels per gallon") +
    xlab("weight (1000/lbs)") +
    geom_point()

# 1. Dar a la longitud del eje de la marca de verificación,
# axis.ticks.length, una unidad de 2 "línes".

# View the original plot
plt_mpg_vs_wt_by_cyl

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the axis tick length to 2 lines
        axis.ticks.length = unit(2, "lines")
    )

# 2. Dar el tamaño de la clave de leyenda,
# legend.key.size, una unidad de 3 centímetros ("cm").

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the legend key size to 3 centimeters
        legend.key.size = unit(3, "cm")
    )

# 3. Establecer el margen de leyenda en 20 puntos ("pt")
# en la parte superior, 30 pts a la derecha,
# 40 pts en la parte inferior y 50 pts a la izquierda.

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the legend margin to (20, 30, 40, 50) points
        legend.margin = margin(20, 30, 40, 50, "pt")
    )

# 4. Establecer el margen del gráfico ,
# plot.margin, a 10, 30, 50 y 70 milímetros ("mm").

plt_mpg_vs_wt_by_cyl +
    theme(
        # Set the plot margin to (10, 30, 50, 70) millimeters
        plot.margin = margin(10, 30, 50, 70, "mm")
    )
