# Dar a todos los rectángulos en el gráfico (el elemento rect)
# un color de relleno de "grey92" (gris muy pálido).
# Eliminar el contorno de legend.key
# estableciendo su color como ausente.
# Observar los cambios en el gráfico.

plt_prop_unemployed_over_time +
    theme(
        # For all rectangles, set the fill color to grey92
        rect = element_rect(fill = "grey92"),
        # For the legend key, turn off the outline
        legend.key = element_rect(color = NA)
    )

# Eliminar las marcas de los ejes, axis.ticks haciéndolos un elemento en blanco.
# Eliminar las líneas de la cuadrícula del panel, panel.grid de la misma manera.
# Observar los cambios en el gráfico.
plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        # Turn off axis ticks
        axis.ticks = element_blank(),
        # Turn off the panel grid
        panel.grid = element_blank()
    )

# Agregar las líneas de la cuadrícula horizontal mayor al gráfico
# usando panel.grid.major.y.
# Establecer el color de la línea en "white",
# el tamaño en 0.5 y el tipo de línea en "dotted".
# Observar los cambios en el gráfico.

plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        # Add major y-axis panel grid lines back
        panel.grid.major.y = element_line(
            # Set the color to white
            color = "white",
            # Set the size to 0.5
            size = 0.5,
            # Set the line type to dotted
            linetype = "dotted"
        )
    )

# Hacer que el texto de las etiquetas de las marcas de los ejes, axis.text,
# sea menos prominente cambiando el color a "grey25".
# Aumentar el tamaño de plot.title a 16 y cambiar su tipo de letra a "italic".
# Observar los cambios en el gráfico.

plt_prop_unemployed_over_time +
    theme(
        rect = element_rect(fill = "grey92"),
        legend.key = element_rect(color = NA),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.grid.major.y = element_line(
            color = "white",
            size = 0.5,
            linetype = "dotted"
        ),
        # Set the axis text color to grey25
        axis.text = element_text(color = "grey25"),
        # Set the plot title font face to italic and font size to 16
        plot.title = element_text(face = "italic", size = 16)
    )
