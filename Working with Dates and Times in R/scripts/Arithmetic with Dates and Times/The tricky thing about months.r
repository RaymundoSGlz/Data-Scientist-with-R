library(lubridate)
jan_31 <- ymd("2024-01-31")
# - Comienza creando una secuencia de 1 a 12 períodos de 1 mes.
# - Agrega `month_seq` a `jan_31`.
## *Observa qué sucede en cualquier mes donde no exista el 31*.
# - Ahora agrega `month_seq` a `jan_31` usando el operador `%m+%`.
# - Intenta restar `month_seq` de `jan_31` usando el operador `%m-%`.

# A sequence of 1 to 12 periods of 1 month
month_seq <- months(1) * 1:12

# Add 1 to 12 months to jan_31
jan_31 + month_seq

# Replace + with %m+%
jan_31 %m+% month_seq

# Replace + with %m-%
jan_31 %m-% month_seq