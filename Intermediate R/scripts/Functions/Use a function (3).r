# Calculate the average number of LinkedIn profile views,
# without specifying any optional arguments.
# Simply print the result to the console.

# Calculate the average number of LinkedIn profile views,
# but this time tell R to strip missing values from the input vector.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)
