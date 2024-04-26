library(fst)
churn <- read_fst("data/churn.fst")

# Ajusta una regresión logística del estado de abandono,
## has_churned versus la duración de la relación con el cliente,
## time_since_first_purchase y la recencia de la compra,
## time_since_last_purchase, y una interacción entre las variables explicativas.

# Fit a logistic regression of churn status vs. length of relationship,
## recency, and an interaction
mdl_churn_vs_both_inter <- glm(
  has_churned ~ time_since_first_purchase * time_since_last_purchase,
  data = churn,
  family = "binomial"
)

# See the result
mdl_churn_vs_both_inter