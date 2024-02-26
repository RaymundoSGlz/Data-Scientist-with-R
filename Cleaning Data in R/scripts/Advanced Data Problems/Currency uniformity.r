library(dplyr)
library(ggplot2)
accounts <- readRDS("data/ch3_1_accounts.rds")
account_offices <- readRDS("data/account_offices.rds")

# Crea un gráfico de dispersión con date_opened en el eje x y total en el eje y.

# Scatter plot of opening date and total amount
accounts %>%
  ggplot(aes(x = date_opened, y = total)) +
  geom_point()

# Haga un "left join" de accounts y account_offices por sus columnas id.

# Left join accounts and account_offices by id
accounts %>%
  left_join(account_offices, by = "id")

# Convierte los total de la oficina de Tokio de yenes a dólares,
# y mantén el total de la oficina de Nueva York en dólares.
# Almacena esto en una nueva columna llamada total_usd.

# Left join accounts to account_offices by id
accounts %>%
  left_join(account_offices, by = "id") %>%
  # Convert totals from the Tokyo office to USD
  mutate(total_usd = ifelse(office == "Tokyo", total / 104, total))

# Crea un gráfico de dispersión de tus nuevos datos uniformes
# usando date_opened en el eje x y total_usd en el eje y.

# Left join accounts to account_offices by id
accounts %>%
  left_join(account_offices, by = "id") %>%
  # Convert totals from the Tokyo office to USD
  mutate(total_usd = ifelse(office == "Tokyo", total / 104, total)) %>%
  # Scatter plot of opening date vs total_usd
  ggplot(aes(x = date_opened, y = total_usd)) +
  geom_point()
