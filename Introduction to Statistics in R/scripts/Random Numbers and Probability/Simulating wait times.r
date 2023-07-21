library(dplyr)
library(ggplot2)
# Establecer una semilla random como 334
set.seed(334)

wait_times <- data.frame(simulation_nb = 1:1000)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
    mutate(time = runif(1000, min = 0, max = 30)) %>%
    # Create a histogram of simulated times
    ggplot(aes(x = time)) +
    geom_histogram(bins = 30)
