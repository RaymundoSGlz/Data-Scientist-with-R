library(lubridate)
# - Crea una duración correspondiente a un Mes Sinódico:
## 29 días, 12 horas, 44 minutos y 3 segundos.
# - Crea una duración correspondiente a un Saros
## multiplicando `sinódico` por 223.
# - Añade `saros` a `eclipse_2017` para predecir el próximo eclipse.

# Time of North American Eclipse 2017
eclipse_2017 <- ymd_hms("2017-08-21 18:26:40")

# Duration of 29 days, 12 hours, 44 mins and 3 secs
synodic <- ddays(29) + dhours(12) + dminutes(44) + dseconds(3)

# 223 synodic months
saros <- synodic * 223

# Add saros to eclipse_2017
eclipse_2017 + saros