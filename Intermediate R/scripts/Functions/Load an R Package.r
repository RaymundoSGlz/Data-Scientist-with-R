# To fix the error you saw in the console, load the ggplot2 package.
# Make sure you are loading (and not installing) the package!
# Now, retry calling the qplot() function with the same arguments.
# Finally, check out the currently attached packages again.

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()
