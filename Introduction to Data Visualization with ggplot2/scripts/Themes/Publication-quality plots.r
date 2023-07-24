# Agregar el tema de Tufte

plt_prop_unemployed_over_time +
    # Add Tufte's theme
    theme_tufte()

# Llamar a la función para agregar elementos de tema individuales.
# Apague la leyenda y las marcas de los ejes.

plt_prop_unemployed_over_time +
    theme_tufte() +
    # Add individual theme elements
    theme(
        # Turn off the legend
        legend.position = "none",
        # Turn off the axis ticks
        axis.ticks = element_blank()
    )

# Establecer el título del eje y el color del texto del eje en grey60.

plt_prop_unemployed_over_time +
    theme_tufte() +
    theme(
        legend.position = "none",
        axis.ticks = element_blank(),
        # Set the axis title's text color to grey60
        axis.title = element_text(color = "grey60"),
        # Set the axis text's text color to grey60
        axis.text = element_text(color = "grey60")
    )

# Establecer los valores de las líneas de cuadrícula del panel y.
# Establezca el color en grey60, el tamaño en 0.25
# y el tipo de línea en punteado.

plt_prop_unemployed_over_time +
    theme_tufte() +
    theme(
        legend.position = "none",
        axis.ticks = element_blank(),
        axis.title = element_text(color = "grey60"),
        axis.text = element_text(color = "grey60"),
        # Set the panel gridlines major y values
        panel.grid.major.y = element_line(
            # Set the color to grey60
            color = "grey60",
            # Set the size to 0.25
            size = 0.25,
            # Set the linetype to dotted
            linetype = "dotted"
        )
    )
