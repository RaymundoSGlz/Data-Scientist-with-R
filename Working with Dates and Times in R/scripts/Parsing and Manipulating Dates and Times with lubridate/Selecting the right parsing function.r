# Para cada fecha, el formato ISO 8601 se muestra como un comentario
## después de ella, para ayudarte a verificar tu trabajo

# - Elige la función correcta para analizar `x`.
# - Elige la función correcta para analizar `y`.
# - Elige la función correcta para analizar `z`.

library(lubridate)

# Parse x
x <- "2010 September 20th" # 2010-09-20
ymd(x)

# Parse y
y <- "02.01.2010" # 2010-01-02
dmy(y)

# Parse z
z <- "Sep, 12th 2010 14:00" # 2010-09-12T14:00
mdy_hm(z)
