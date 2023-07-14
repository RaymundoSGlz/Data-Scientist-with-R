# When did LinkedIn views exceed 10
# and did Facebook views fail to reach 10 for a particular day?
# Use the linkedin and facebook vectors.

# When were one or both of your LinkedIn and Facebook
# profiles visited at least 12 times?

# When is the views matrix equal to a number between 11 and 14,
# excluding 11 and including 14?

# The social data (linkedin, facebook, views) has been created for you
facebook <- c(17, 7, 5, 16, 8, 13, 14)
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
views <- matrix(c(facebook, linkedin), ncol = 7)

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <= 14
