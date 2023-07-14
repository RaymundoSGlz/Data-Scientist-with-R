# Select the entire second column, named day2,
# from the li_df data frame as a vector and assign it to second.

# Use second to create a logical vector, that contains TRUE if the corresponding
# number of views is strictly greater than 25 or strictly lower than 5
# and FALSE otherwise.

# Store this logical vector as extremes.
# Use sum() on the extremes vector to calculate the number of TRUEs in extremes
# (i.e. to calculate the number of employees that are either very popular
# or very low-profile). Simply print this number to the console.

# li_df is pre-loaded in your workspace
values <- c(2, 19, 24, 22, 25, 22, 0, 12, 19, 23, 29, 13, 7, 26, 7, 32, 7, 9,
    0, 9, 6, 17, 1, 5, 2, 29, 17, 26, 27, 4, 22, 9, 6, 18, 2, 32, 5, 6, 30,
    34, 15, 28, 6, 17, 6, 18, 21, 10, 6, 30)
li_df <- matrix(values, nrow = 50, ncol = 7, byrow = TRUE,
dimnames = list(paste0("employee_", 1:50), paste0("day", 1:7)))

# Select the second column, named day2, from li_df: second
second <- li_df[, 2]

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- second > 25 | second < 5

# Count the number of TRUEs in extremes
sum(extremes)
