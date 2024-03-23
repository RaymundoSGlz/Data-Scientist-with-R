library(lubridate)
# - `x` es una fecha y hora más complicada.
## Usa las pistas en las instrucciones para analizar `x`.
# - `two_orders` tiene dos órdenes diferentes,
## analiza ambas especificando el orden a ser `c("mdy", "dmy")`.
# - Analiza `short_dates` con `orders = c("dOmY", "OmY", "Y")`.
## *¿Qué sucede con las fechas que no tienen meses o días especificados?*

# Specify an order string to parse x
x <- "Monday June 1st 2010 at 4pm"
parse_date_time(x, orders = "Amdy_Ip")

# Specify order to include both "mdy" and "dmy"
two_orders <- c(
  "October 7, 2001", "October 13, 2002", "April 13, 2003",
  "17 April 2005", "23 April 2017"
)
parse_date_time(two_orders, orders = c("mdy", "dmy"))

# Specify order to include "dOmY", "OmY" and "Y"
short_dates <- c("11 December 1282", "May 1372", "1253")
parse_date_time(short_dates, orders = c("dOmY", "OmY", "Y"))
