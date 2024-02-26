library(dplyr)
library(lubridate)
accounts <- readRDS("data/ch3_1_accounts.rds")

# Echa un vistazo al inicio de accounts
# para tener una idea de los datos con los que estás trabajando.

# Check out the accounts data frame
head(accounts)

# Convierte las fechas en la columna date_opened al mismo formato
# utilizando el vector formats
# y guarda esto como una nueva columna llamada date_opened_clean.

# Define the date formats
formats <- c("%Y-%m-%d", "%B %d, %Y")

# Convert dates to the same format
accounts %>%
  mutate(date_opened_clean = parse_date_time(date_opened, orders = formats))
