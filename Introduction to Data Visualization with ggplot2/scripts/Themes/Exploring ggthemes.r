library(ggthemes)
# 1. Agregar el tema de fivethirtyeight.com,
# theme_fivethirtyeight (), al gráfico.
# ¿Qué cambió en el gráfico?

# Use the fivethirtyeight theme
plt_prop_unemployed_over_time + theme_fivethirtyeight()

# 2. Agregue un tema de Edward Tufte, theme_tufte (), al gráfico.
# ¿Qué cambió en el gráfico?

# Use the Tufte theme
plt_prop_unemployed_over_time + theme_tufte()

# 3. Agregue un tema de Wall Street Journal, theme_wsj (), al gráfico.
# ¿Qué cambió en el gráfico?

# Use the Wall Street Journal theme
plt_prop_unemployed_over_time + theme_wsj()
