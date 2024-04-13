library(dplyr)
sp500_yearly_returns <- readRDS("data/sp500_yearly_returns.rds")

# 1. Ejecute una regresión lineal en `return_2019` versus `return_2018`
## utilizando `sp500_yearly_returns`. Asigne a `mdl_returns`.

# Run a linear regression on return_2019 vs. return_2018
## using sp500_yearly_returns
mdl_returns <- lm(
  return_2019 ~ return_2018,
  data = sp500_yearly_returns
)

# See the result
mdl_returns

# 2. Cree un dataframe (o tibble) llamado `explanatory_data`.
## Agregue una columna con rendimientos de 2018
## establecidos en un vector que contenga `1`, `0`, y `1`.
###  - Utilice `mdl_returns` para predecir con `explanatory_data`.

# Create a data frame with return_2018 at -1, 0, and 1 
explanatory_data <- tibble(
  return_2018 = c(-1, 0, 1)
)


# Use mdl_returns to predict with explanatory_data
predict(mdl_returns, explanatory_data)