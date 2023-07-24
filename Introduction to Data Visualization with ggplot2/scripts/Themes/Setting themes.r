# Asignar el tema a theme_recession
# Agregar el tema Tufte y theme_recession juntos
# Use el tema de recesión de Tufte agregándolo al gráfico.

# Theme layer saved as an object, theme_recession
theme_recession <- theme(
    rect = element_rect(fill = "grey92"),
    legend.key = element_rect(color = NA),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(
        color = "white",
        size = 0.5, linetype = "dotted"
    ),
    axis.text = element_text(color = "grey25"),
    plot.title = element_text(face = "italic", size = 16),
    legend.position = c(0.6, 0.1)
)

# Combine the Tufte theme with theme_recession
theme_tufte_recession <- theme_tufte() + theme_recession

# Add the recession theme to the plot
plt_prop_unemployed_over_time + theme_tufte_recession

# Usar theme_set() para establecer theme_tufte_recession
# como el tema predeterminado.
# Dibuje el gráfico, plt_prop_unemployed_over_time,
# sin agregar explícitamente un tema.
# Mira el gráfico. ¿Fue estilizado con el tema predeterminado o el nuevo tema?

# Set theme_tufte_recession as the default theme
theme_set(theme_tufte_recession)

# Draw the plot (without explicitly adding a theme)
plt_prop_unemployed_over_time
