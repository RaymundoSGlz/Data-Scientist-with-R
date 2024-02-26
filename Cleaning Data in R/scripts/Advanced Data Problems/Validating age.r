# Crea una nueva columna llamada theoretical_age
## que contenga la edad de cada cuenta basada en la date_opened.
# Encuentra las cuentas donde la acct_age no coincide con la theoretical_age.
library(dplyr)
library(lubridate)
accounts <- readRDS("data/accounts_with_founds.rds")

# Find invalid acct_age
accounts %>%
  # theoretical_age: age of acct based on date_opened
  mutate(
    theoretical_age = floor(as.numeric(date_opened %--% today(), "years"))
  ) %>%
  # Filter for rows where acct_age is different from theoretical_age
  filter(acct_age != theoretical_age)
