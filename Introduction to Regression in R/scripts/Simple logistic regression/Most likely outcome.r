library(dplyr)
library(ggplot2)
library(fst)
churn <- read_fst("data/churn.fst")
mdl_churn_vs_relationship <- glm(
  formula = has_churned ~ time_since_first_purchase, family = binomial,
  data = churn
)
explanatory_data <- tibble(
  time_since_first_purchase = seq(-1.5, 4, 0.25)
)
plt_churn_vs_relationship <- churn %>%
  ggplot(aes(x = time_since_first_purchase, y = has_churned)) +
  geom_point() +
  geom_smooth(
    method = "glm", se = FALSE, method.args = list(family = "binomial")
  )

# 1. Update `prediction_data` to add a column of the most likely churn outcome,
## `most_likely_outcome`.

# Update the data frame
prediction_data <- explanatory_data %>%
  mutate(
    has_churned = predict(
      mdl_churn_vs_relationship, explanatory_data,
      type = "response"
    ),
    # Add the most likely churn outcome
    most_likely_outcome = round(has_churned)
  )

# See the result
prediction_data

# 2. Update `plt_churn_vs_relationship`, adding yellow points of size 2
## with `most_likely_outcome` as the y aesthetic, using `prediction_data`.

# Update the plot
plt_churn_vs_relationship +
  # Add most likely outcome points from prediction_data, colored yellow, size 2
  geom_point(
    data = prediction_data,
    aes(y = most_likely_outcome), color = "yellow", size = 2
  )
