# Write R expressions to solve the following questions
# concerning the variable last:

# Is last under 5 or above 10?
# Is last between 15 and 20, excluding 15 but including 20?

# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last > 5 | last < 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <= 20
