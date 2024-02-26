library(visdat)
library(dplyr)
accounts <- readRDS("data/accounts_invest.rds")
accounts$cust_id <- ifelse(accounts$cust_id == "<NA>", NA, accounts$cust_id)


# Visualiza los valores faltantes en accounts por columna
# usando una función del paquete visdat.

# Visualize the missing values by column
vis_miss(accounts)

# Agregue una columna lógica a accounts llamada missing_inv
## que indique si a cada fila le falta el inv_amount o no.
# Agrupe por missing_inv.
# Calcule la edad media para cada grupo de missing_inv.

accounts %>%
  # missing_inv: Is inv_amount missing?
  mutate(missing_inv = is.na(inv_amount)) %>%
  # Group by missing_inv
  group_by(missing_inv) %>%
  # Calculate mean age for each missing_inv group
  summarize(avg_age = mean(age, na.rm = TRUE))

# Ordene accounts por age.
# Visualice los datos faltantes por columna.

# Sort by age and visualize missing vals
accounts %>%
  arrange(age) %>%
  vis_miss()
