library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# Run a linear regression of price_twd_msq vs. n_convenience
lm(price_twd_msq ~ n_convenience, data = taiwan_real_estate)
