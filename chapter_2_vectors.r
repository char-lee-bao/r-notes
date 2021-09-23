# Consider a series of discrete data that represents the weather
# Let 0 values indicate no rain, and let 1 indicate rain
# Given the series of data, preditc the value for the next day based on the last k days
# Use the majority rule to predict the next value
preda <- function(x, k) {
    n <- length(x)
    k2 <- k / 2 # Majority threshold
    predictions <- vector(length = n - k) # Vector containing predictions
    for (i in 1:(n - k + 1)) {
        if (sum(x[i:(i + k - 1)]) >= k2) {
            predictions[i] <- 1
        } else {
            predictions[i] <- 0
        }
    }
    return(mean(abs(predictions - x[(k+1):n]))) # Return the proportion of incorrect predictions
}

# While this function works, the sum() function is computationally intensive
# Note that for each loop iteration, the result only differs by two elements (removing an element, adding a element)
# The following version reduces the sum() function to 2 operations each loop iteration
predb <- function(x, k) {
    n <- length(x)
    past <- sum(x[1:k]) # Establish the past k days of data
    k2 <- k / 2
    predictions <- vector(length = n - k)
    for (i in 1:(n - k + 1)) {
        if (past >= k2) {
            predictions[i] <- 1
        } else {
            predictions[i] <- 0
        }
        past <- past - x[i] + x[i + k] # Update the past k days of data
    }
    return(mean(abs(predictions - x[(k+1):n])))
}

# Another approach is to use the cumsum() function
# The cumsum() function returns cumulative sums from a vector
predc <- function(x, k) {
    n <- length(x)
    k2 <- k / 2
    cumulative_sums <- c(0, cumsum(x)) # Prepend 0 in case i = 0
    predictions <- vector(length = n - k)
    for (i in 1:(n - k)) {
        if (cumulative_sums[i + k] - cumulative_sums[i] >= k2) { # One subtraction operation
                predictions[i] <- 1
            } else {
                predictions[i] <- 0
            }
    }
}

# As shown above, vectorized operations improve performance significantly
# Most basic operations (e.g. +, *, etc.) are vectorized
# More complex functions can be built off of these simpler operations
u <- c(5, 2, 8)
v <- c(1, 3, 9)
u > v # (TRUE, FALSE, FALSE)
w <- function(x) return(x + 1) # A vectorized function
w(u) # (6, 3, 9)
# More complex operations are also vectorized
sqrt(1:9)
round(1.2) # Returns 1
y <- c(1.2, 3.9, 0.4)
z <- round(y)
print(z)

# R defaults to a vector argument
y <- c(12, 5, 13)
'+'(y, 4) # Returns (16, 9, 17) - (4, 4, 4) is assumed for the argument 4
f <- function(x, c) {
    return ((x + c) ^ 2)
}
f(1:3,0) # (1, 4, 9)
f(1:3,1) # (4, 9, 16)
f(1:3,1:3) # Square each sum of elementwise addition
# A check for a scalar value must be included if c is supposed to be a scalar
f <- function(x, c) {
    if (c != 1) {
        stop("vector c not allowed")
    } else {
        return((x + c) ^ 2)
    }
}

# The functions thus far do not change the type of data
z12 <- function(z) return (c(z, z^2))
x <- 1:8
z12(x) # Returns a larger vector
# Changing the type of data returned by the function is possible
print(matrix(z12(x), ncol = 2))
# The matrix() function works, but sapply() - simplify apply - is better
sapply(1:8, z12) # Apply z12 to the vector and simplify the result
# Note the matrix has different dimensions
