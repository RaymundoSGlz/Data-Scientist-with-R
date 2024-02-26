library(dplyr)
library(assertive)
accounts <- readRDS("data/accounts_invest.rds")
accounts$cust_id <- ifelse(accounts$cust_id == "<NA>", NA, accounts$cust_id)

# Filtra accounts para eliminar las filas con cust_ids faltantes
## y guarda como accounts_clean.

# Create accounts_clean
accounts_clean <- accounts %>%
  # Filter to remove rows with missing cust_id
  filter(!is.na(cust_id))

accounts_clean

# Cree una nueva columna llamada acct_amount_filled,
## que contiene los valores de acct_amount,
## excepto que todos los valores NA deben ser reemplazados
## con 5 veces la cantidad en inv_amount

# Create accounts_clean
accounts_clean <- accounts %>%
  # Filter to remove rows with missing cust_id
  filter(!is.na(cust_id)) %>%
  # Add new col acct_amount_filled with replaced NAs
  mutate(
    acct_amount_filled = ifelse(is.na(acct_amount), 5 * inv_amount, acct_amount)
  )

accounts_clean

# Asegúrese de que no haya valores faltantes en la columna cust_id
## de accounts_clean.

# Assert that cust_id has no missing vals
assert_all_are_not_na(accounts_clean$cust_id)

# Asegúrese de que no haya valores faltantes en la columna acct_amount_filled
## de accounts_clean.

# Assert that acct_amount_filled has no missing vals
assert_all_are_not_na(accounts_clean$acct_amount_filled)