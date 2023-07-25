library(ggplot2)
library(lubridate)
library(dplyr)
airquality <- airquality %>%
  mutate(Date = make_date(1974, Month, Day))
# Empezar con un gráfico de línea estándar, de Temp descrito por Date
# en el conjunto de datos airquality.
ggplot(airquality, aes(x = Date, y = Temp)) +
  geom_line() +
  labs(x = "Date (1973)", y = "Fahrenheit")

# Convertir y_breaks de Fahrenheit a Celsius
# (restar 32, luego multiplicar por 5, luego dividir por 9).
# Defina el eje y secundario usando sec_axis ().
# Use la transformación identity.
# Establezca los breaks y los labels a los objetos definidos
# y_breaks y y_labels, respectivamente.

# Define breaks (Fahrenheit)
y_breaks <- c(59, 68, 77, 86, 95, 104)

# Convert y_breaks from Fahrenheit to Celsius
y_labels <- (y_breaks - 32) * 5 / 9

# Create a secondary x-axis
secondary_y_axis <- sec_axis(
  # Use identity transformation
  trans = identity,
  name = "Celsius",
  # Define breaks and labels as above
  breaks = y_breaks,
  labels = y_labels
)

# Examine the object
secondary_y_axis

# Agregar el eje y secundario al argumento sec.axis de scale_y_continuous().

# Update the plot
ggplot(airquality, aes(Date, Temp)) +
  geom_line() +
  # Add the secondary y-axis
  scale_y_continuous(sec.axis = secondary_y_axis) +
  labs(x = "Date (1973)", y = "Fahrenheit")
