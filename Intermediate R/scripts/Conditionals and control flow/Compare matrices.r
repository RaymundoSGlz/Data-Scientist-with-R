# Using the relational operators you've learned so far,
# try to discover the following:

# When were the views exactly equal to 13? 
#Use the views matrix to return a logical matrix.

# For which days were the number of views less than or equal to 14?
# Again, have R return a logical matrix.

# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14
