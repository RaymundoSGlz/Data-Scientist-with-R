library(openintro)
library(dplyr)
library(ggplot2)

# Construye una cadena para responder cada una de las siguientes preguntas,
## ambas sobre la variable `dollar`.

# - Para correos electrónicos que contienen la palabra "dollar",
## ¿el correo electrónico típico de spam contiene un mayor número
## de ocurrencias de la palabra que el correo electrónico típico no-spam?
## Crea una estadística resumida que responda a esta pregunta.
# - Si te encuentras con un correo electrónico con más de 10 ocurrencias
## de la palabra `dollar`,
## ¿es más probable que sea spam o no-spam?
## Crea un gráfico de barras que responda a esta pregunta.

# Question 1
email %>%
  filter(dollar > 0) %>%
  group_by(spam) %>%
  summarize(mean_dollar = mean(dollar))

# Question 2
email %>%
  filter(dollar > 10) %>%
  ggplot(aes(x = spam)) +
  geom_bar()