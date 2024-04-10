library(openintro)
library(dplyr)
library(ggplot2)

# El conjunto de datos `email` todavía está disponible en tu espacio de trabajo.

# - Calcula las medidas apropiadas del centro y la dispersión de `exclaim_mess`
## para ambos, spam y no spam, usando `group_by()` y `summarize()`.
# - Construye un gráfico adecuado para visualizar la asociación
## entre las mismas dos variables,
## agregando un paso de transformación logarítmica si es necesario.
# - Si decides usar una transformación logarítmica,
## recuerda que `log(0)` es `Inf` en R, ¡que no es un valor muy útil!
## Puedes solucionar esto añadiendo un número pequeño (como `0.01`)
## a la cantidad dentro de la función `log()`. De esta manera,
## tu valor nunca es cero.
## Este pequeño desplazamiento hacia la derecha no afectará tus resultados.

# Compute center and spread for exclaim_mess by spam
email %>%
  group_by(spam) %>%
  summarize(
    mean(exclaim_mess),
    sd(exclaim_mess)
  )

# Create plot for spam and exclaim_mess
email %>%
  mutate(log_exclaim_mess = log(exclaim_mess + 0.01)) %>%
  ggplot(aes(x = log_exclaim_mess)) +
  geom_histogram(bins = 30) +
  facet_wrap(~ spam) +
  labs(
    x = "Log of exclaim_mess",
    y = "Count",
    title = "Distribution of exclaim_mess by spam"
  )
