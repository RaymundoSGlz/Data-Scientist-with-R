library(ggplot2)
library(dplyr)
library(fst)
ad_conversion <- read_fst("data/ad_conversion.fst")

# 1. *Ejecuta el código proporcionado y mira el gráfico.*
#    - Edita el gráfico para que las estéticas x e y
## se transformen elevándolas a la potencia `0.25`.
#    - *Mira el nuevo gráfico. ¿Los puntos siguen la línea más de cerca?*

# Run the code to see the plot
# Edit to raise x, y aesthetics to power 0.25
ggplot(ad_conversion, aes(n_impressions^0.25, n_clicks^0.25)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# 2. Ejecuta una regresión lineal de `n_clicks` a la potencia `0.25` versus
## `n_impressions` a la potencia `0.25` usando `ad_conversion`.
## *Cada variable en la fórmula necesita ser especificada "tal cual",
## usando `I()`.*

# Run a linear regression of n_clicks to the power 0.25 vs. n_impressions
## to the power 0.25 using ad_conversion
mdl_click_vs_impression <- lm(
  I(n_clicks^0.25) ~ I(n_impressions^0.25),
  data = ad_conversion
)

# 3. Completa el código para los datos de predicción.
## Usa `mdl_click_vs_impression` para predecir `n_clicks` a la potencia `0.25`
## a partir de `explanatory_data`.
#   - Realiza una transformación inversa elevando `n_clicks_025`
## a la potencia `4` para obtener `n_clicks`.

explanatory_data <- tibble(
  n_impressions = seq(0, 3e6, 5e5)
)

prediction_data <- explanatory_data %>%
  mutate(
    # Use mdl_click_vs_impression to predict n_clicks ^ 0.25
    n_clicks_025 = predict(mdl_click_vs_impression, explanatory_data),
    # Back transform to get n_clicks
    n_clicks = n_clicks_025^4
  )

# 4. Edita el gráfico para agregar una capa de puntos de `prediction_data`,
## coloreados de `"verde"`.

ggplot(ad_conversion, aes(n_impressions ^ 0.25, n_clicks ^ 0.25)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add points from prediction_data, colored green
  geom_point(data = prediction_data, color = "green")