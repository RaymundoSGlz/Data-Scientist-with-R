# Crea una nueva columna llamada theoretical_total
## que contenga la suma de las cantidades en cada fondo.
# Encuentra las cuentas donde el total no coincide con el theoretical_total.

library(dplyr)
accounts <- readRDS("data/accounts_with_founds.rds")

# Find invalid totals
accounts %>%
  # theoretical_total: sum of the three funds
  mutate(theoretical_total = fund_A + fund_B + fund_C) %>%
  # Find accounts where total doesn't match theoretical_total
  filter(total != theoretical_total)
