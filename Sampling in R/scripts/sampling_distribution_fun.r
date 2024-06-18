#' Generate a Sampling Distribution of Mean Attrition
#'
#' This function generates a sampling distribution of the mean attrition for a given sample size.
#'
#' @param sample_size The size of each sample to be drawn from the population.
#' @return A tibble with two columns: 'replicate' (the replicate number) and 'mean_attrition' (the mean attrition for each replicate).
sampling_distribution_fun <- function(sample_size) {
  # Create a vector with the results of 1000 replications
  results <- replicate(
    n = 1000,
    expr = attrition_pop %>%
      slice_sample(n = sample_size) %>%
      summarize(mean_attrition = mean(Attrition == "Yes")) %>%
      pull(mean_attrition)
  )

  # Convert the results into a tibble with two columns
  tibble(
    replicate = 1:1000,
    mean_attrition = results
  )
}
