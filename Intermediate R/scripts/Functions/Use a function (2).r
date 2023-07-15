# Calculate the mean of the element-wise sum of linkedin and facebook
# and store the result in a variable avg_sum.

# Calculate the mean once more, but this time set the trim argument equal to 0.2
# and assign the result to avg_sum_trimmed.

# Print out both avg_sum and avg_sum_trimmed; can you spot the difference?

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed
