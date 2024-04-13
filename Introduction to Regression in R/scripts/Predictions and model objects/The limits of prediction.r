library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)

# Define a tibble where n_convenience is -1
minus_one <- tibble(
  n_convenience = -1
)

# Define a tibble where n_convenience is 2.5
two_pt_five <- tibble(
  n_convenience = 2.5
)
