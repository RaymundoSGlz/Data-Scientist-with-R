library(ggplot2)
library(datasets)
TG <- ToothGrowth
# El primer gráfico contiene etiquetas ilegibles a propósito.
# Es un problema común que puede ocurrir al cambiar el tamaño de los gráficos.
# También hay demasiada tinta no relacionada con los datos.
# Cambiar theme_gray(3) a theme_classic().

# Initial plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    position = position_dodge(0.1)
  ) +
  theme_classic()

# View plot
growth_by_dose

# Nuestro gráfico anterior todavía tiene un problema importante,
# la dosis se almacena como una variable de factor.
# Es por eso que el espaciado está apagado entre los niveles.
# usar as.character() envuelto en as.numeric()
# para convertir la variable de factor en números reales (continuos).

# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    position = position_dodge(0.2)
  ) +
  theme_classic()

# View plot
growth_by_dose

# Usar la geometría apropiada para los datos
# En la nueva función stat_summary(), establezca fun para calcular la media
# y la geometría a "line" para conectar los puntos en sus valores medios.

# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    position = position_dodge(0.2)
  ) +
  # Use the right geometry
  stat_summary(
    fun = mean,
    geom = "line",
    position = position_dodge(0.1)
  ) +
  theme_classic()

# View plot
growth_by_dose

# Asegurar que las etiquetas sean informativas:
# Agregue las unidades "(mg/day)" y "(mean, standard deviation)"
# a las etiquetas x e y, respectivamente.
# Use la paleta "Set1".
# Establezca las etiquetas de leyenda en "Orange juice" y "Ascorbic acid".

# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    position = position_dodge(0.2)
  ) +
  stat_summary(
    fun = mean,
    geom = "line",
    position = position_dodge(0.1)
  ) +
  theme_classic() +
  # Adjust labels and colors:
  labs(
    x = "Dose (mg/day)",
    y = "Odontoblasts length (mean, standard deviation)",
    color = "Supplement"
  ) +
  scale_color_brewer(
    palette = "Set1",
    labels = c("Orange juice", "Ascorbic acid")
  ) +
  scale_y_continuous(
    limits = c(0, 35),
    breaks = seq(0, 35, 5), expand = c(0, 0)
  )

# View plot
growth_by_dose
