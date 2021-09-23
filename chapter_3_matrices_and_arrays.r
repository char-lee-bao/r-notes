# Chapter 3: Matrices and Arrays
# A matrix is a vector with two additional attributes - the number of rows and the number of columns
# Matrices are cases of the more general array object - typically arrays are 2-dimensional, but higher dimensions are possible

# 3.1 Creating Matrices
# Subscripts begin with 1
# Columns and rows are numbered from left to right and top to bottom
# Matrix data is stored columnwise (i.e. column major order)
# Elements are stored "vertically"
# Use the matrix() function to create a matrix
y <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
print(y)
# ncol and nrow are optional arguments based on context
y <- matrix(c(1, 2, 3, 4), nrow = 2)
y <- matrix(c(1, 2, 3, 4), ncol = 2)
# Matrices can be built elementwise
y <- matrix(nrow = 2, ncol = 2)
y[1, 1] <- 1
y[2, 1] <- 2
y[1, 2] <- 3
y[2, 2] <- 4
# The conventional column-major order can be overwritten
# The byrow argument enables input by row-major order
# [1, 2, 3]
# [4, 5, 6]
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = TRUE)
# Note the data is still stored by column-major order
m + (2, 1, 2, 1, 2, 1)
# [3, 5, 7]
# [3, 5, 7]

# 3.2 General Matrix Operations
# Common operations include linear algebra operations, indexing, and filtering
# 3.2.1 Performing Linear Algebra Operations on Matrices
y %*% y # Mathematical matrix multiplication
# [1, 3] * [1, 3] = [1*1 + 3*2, 1*3 + 3*4] = [7, 15]
# [2, 4]   [2, 4]   [2*1 + 4*2, 2*3 + 4*4]   [10, 22]
3 * y # Scalar multiplication
# [3, 3] * [1, 3] = [3, 9]
# [3, 3]   [2, 4]   [6, 12]
y + y # Matrix addition
# [1, 3] + [1, 3] = [2, 6]
# [2, 4]   [2, 4]   [4, 8]

# 3.2.2 Matrix Indexing
z <- matrix(1, 2, 3, 4, 1, 1, 0, 0, 1, 0, 1, 0, nrow = 4)
print(z)
z[, 2:3] # Select the 2nd and 3rd columns
# [1, 1]
# [0, 1]
# Rows can be specified as well
y <- matrix(c(11, 12, 21, 22, 31, 32), byrow = TRUE, nrow = 3)
# [1, 0]
# [0, 0]
y[2:3, ] # Elements 21, 22, 31, 32
# Values of submatrices can be reassigned
y <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 2)
# [1, 4]
# [2, 5]
# [3, 6]
y[c(1, 3), ] <- matrix(c(1, 1, 8, 12), nrow = 2)
# [1,  8] <- [1, 4]
# [1, 12]    [3, 6]
print(y)
# [1, 8]
# [2, 5]
# [1, 12]
# Another example of submatrix reassignment:
x <- matrix(nrow = 3, ncol = 3)
y <- matrix(c(4, 5, 2, 3), nrow = 2)
x[2:3, 2:3] <- y # Embed the the 2 by 2 matrix in the lower right
# Like with vectors, negative indices indicate exclusions
y <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 2)
y[-2, ] # The matrix above without the 2nd row
# [1, 4]
# [3, 6]

# 3.3.3 Extended Example: Image Manipulation
# Consider a grayscale image
# The data of an image is stored as a matrix
# Each pixel is stored as a value in a matrix - RGB images have three matrices
# library(pixmap)
# mtrush1 <- read.pnm("mtrush1.pgm")
# mtrush1
# plot(mtrush1)
# str(mtrush1) # Shows the properties of this instance of the pixmap class
# mtrush1@grey is the intensity matrix
# Each value indicates the shade of gray for a corresponding pixel
# 0.0 denotes black, and 1.0 denotes white
# A portion of the picture can be blocked
# mtrush2 <- mtrush1
# mtrush2@grey[84:163, 135:177] <- 1 # White out a region
# plot(mtrush2)
# Instead of blocking part of the image, noise can be added
# adds random noise to img, at the range rows, cols of img; img and the
# return value are both objects of class pixmap; the parameter q
# controls the weight of the noise, with the result being 1-q times the
# original image plus q times the random noise
# blurpart <- function(img, rows, cols, q) {
#     lrows <- length(rows)
#     lcols <- length(cols)
#     newimg <- img
#     # runif() function is the random uniform function
#     randomnoise <- matrix(nrow = lcols, ncol = lcols, runif(lrows * lcols))
#     newimg@grey <- (1-q) * img@grey + q * randomnoise
#     return(newimg)
# }
# mtrush3 <- blurpart(mtrush1, 84:163, 135:177, 0.65)
# plot(mtrush3)

# 3.3.4 Filtering on Matrices
# Similar to vectors, filtering is possible for matrices
x <- matrix(c(1, 2, 3, 2, 3, 4), nrow = 3)
x[x[, 2] >= 3, ]
# x[(2, 3, 4) >= 3, ]
# x[(FALSE, TRUE, TRUE), ] - rows 2 and 3 are returned
# The filtering critierion can be separate from the variable applied to
z <- c(5, 12, 13)
x[z %% 2 == 1,]
# x[(TRUE, FALSE, TRUE), ]
# [1, 2]
# [3, 4]
m <- matrix(c(1, 2, 3, 4, 5, 6))
m[m[, 1] > 1 & m[, 2] >  5,]
# m[(FALSE, TRUE, TRUE) & (FALSE, FALSE, TRUE), ]
# m[(FALSE, FALSE, TRUE), ]
# (3, 6)
# Functions applied to vectors can also be applied to matrices
m <- matrix(c(5, 2, 9, -1, 10, 11), nrow = 3)
# The matrix is treated as a vector
# Indices of (5, 9, 10, 11) are returned
which(m > 2)

# 3.3.5 Extended Example: Generating a Covariance Matrix
# The row() and col() functions return indices for a matrix element
a <- matrix(c(17, 19, 18, 20), nrow = 2)
print(row(a[2,2])) # Returns 2
# Consider simulations for multivariate normal distributions
# A symmetric matrix - a covariance matrix - is needed
# Suppose there is a n-variate normal distribution
# The covariance matrix will contain n rows and n columns
# E.g. for 3 variables, if the correlation between variables is 0.2:
# [1,   0.2, 0.2]
# [0.2,   1, 0.2]
# [0.2, 0.2,   1]
# The function below creates the covariance matrix in the general case
makecov <- function(rho, n) {
    m <- matrix(nrow = n, ncol = n)
    # Assign a value of dispersion to each pair of variables
    # If the element is on the diagonal, variance = 1
    # Otherwise, correlation = rho
    m <- ifelse(row(m) == col(m), 1, rho)
    return(m)
}

# 3.4 Applying Functions to Matrix Rows and Columns
# The *apply() family of functions are key features of R
# The family of functions include apply(), tapply(), and lapply()

# 3.4.1. Using the apply() function
# General form of apply()
# apply(m, dimcode, f, fargs)
# m is the matrix
# f is the function to be applied
# fargs is an optional set of arguments to be supplied to f
# dimcode is the dimension that the function is applied to
# dimcode = 1 if the function applies to rows
# dimcode = 2 if the function applies to columns
z <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3)
apply(z, 2, mean) # Average the columns of z
# The colMeans() function also works in the example above
f <- function(x) x / c(2, 8)
# Returns
# [0.5, 1.000, 1.50]
# [0.5, 0.625, 0.75]
y <- apply(z, 1, f)
# The matrix transposition is the result of apply()
# If the function to be applied returns a vector with k compenents
# The result of apply() will have k rows
# The transpose function t() can change the result
print(t(y))
# Note that the function f() has argument x
# The dimcode determines how this argument is applied
# Functions applied by the *apply() family can have more than 1 argument
# Consider a matrix of 1s and 0s
# Construct a vector based on the majority of the first d elements of each row
copymaj <- function(row, d) {
    maj <- sum(row[1:d]) / d
    return(if (maj > 0.5) 1 else 0)
}
x1 <- c(1, 0, 1, 1, 0)
x2 <- c(1, 1, 1, 1, 0)
x3 <- c(1, 0, 0, 1, 1)
x4 <- c(0, 1, 1, 1, 0)
x <- matrix(c(x1, x2, x3, x4), nrow =  4, byrow = TRUE)
# x has 4 rows, apply() will have 4 components
# Returns (1, 1, 0, 1)
apply(x, 1, copymaj, 3) # Additional argument d = 3
# Returns (0, 0, 1, 0)
apply(x, 1, copymaj, 2)

# 3.4.2 Extended Example: Finding Outliers
# Outliers - data points that differ greatly from the majority of observations
# Erroneous or unrepresentative data points can be identified as follows
# Consider a matrix that contain retail sales data
# Each row contains daily sales figures for a specific store
findols <- function(x) {
    findol <- function(xrow) {
        mdn <- median(xrow)
        devs <- abs(xrow - mdn) # Recycling mdn
        # which.max() function returns the index of the maximum element
        return(which.max(devs))
    }
    return(apply(x, 1, findols))
}
# Since the apply function is contained within the function, the call is:
# findols(rs)

# 3.5 Adding and Deleting Matrix Rows and Columns
# Like vectors, matrices have fixed dimensions
# Reassignment is required when adding/deleting rows/columns

# 3.5.1 Changing the Size of a Matrix
# The rbind() and cbind() functions add rows or columns to a matrix
one <- c(1, 1, 1, 1)
z1 <- c(1, 1, 1)
z2 <- c(2, 1, 0)
z3 <- c(3, 0, 1)
z4 <- c(4, 0, 0)
z <- matrix(c(z1, z2, z3, z4), byrow = TRUE, nrow = 4)
print(cbind(one, z)) # append one as a column to z
z <- cbind(one, z)
print(cbind(1, z)) # Recycling works as expected
# Functions cbind() and rbind() can construct a matrix
q <- cbind(c(1, 2), c(3, 4))
# Note that adding rows/columns is computationally intensive due to reassigning
# Creating a larger matrix in the first place is best practice
# Deleting rows/columns requires reassignment too
m <- matrix(1:6, nrow = 3)
# [1, 4]
# [2, 5]
# [3, 6]
print(m)
m <- m[c(1, 3), ] # Cut out row 2
# [1, 4]
# [3, 6]
print(m)

# 3.5.2 Extended Example: Finding the Closest Pair of Vertices in a Graph
# Consider a function that inputs a distance matrix
# For each element in row i, column j, compute the distance between cities i, j
# Returns the minimum value of d[i, j], i != j, and the row/col attaining
# that minimum, for square symmetric matrix d; no special policy on ties
mind <- function(d) {
    n <- nrow(d)
    # Add a column to identify row number for apply()
    dd <- cbind(d, 1:n)
    # dd[-n] contains no new information, so it can be skipped
    wmins <- apply(dd[-n, ], 1, imin)
    # wmins will be 2xn, 1st row being indices and 2nd being values
    i <- which.min(wmins[2, ])
    j <- wmins[1, i]
    return(c(d[i,j],i,j))
}

# Finds the location, value of the minimum in a row x
imin <- function(x) {
    lx <- length(x)
    i <- x[lx] # original row number
    # Focus on elements in the upper right triangle of the matrix
    # j is an index relative to the diagonal
    # If j = 1, then the element lies 1 element to the right of the diagonal
    j <- which.min(x[(i + 1):(lx - 1)])
    # Whereas k is the column index
    k <- i + j
    return(c(k, x[k]))
}
q1 <- c(0,  12, 13,  8,  20)
q2 <- c(12,  0, 15, 28,  88)
q3 <- c(13, 15,  0,  6,   9)
q4 <- c(8,  28,  6,  0,  33)
q5 <- c(20, 88,  9,  33,  0)
q <- matrix(c(q1, q2, q3, q4, q5), byrow = TRUE, nrow = 5)
mind(q)
# dd
# [0,  12, 13,  8, 20, 1]
# [12,  0, 15, 28, 88, 2]
# [13, 15,  0,  6,  9, 3]
# [8,  28,  6,  0, 33, 4]
# [20, 88,  9, 33,  0, 5]
# wmins apply() argument
# [0,  12, 13,  8, 20, 1]
# [12,  0, 15, 28, 88, 2]
# [13, 15,  0,  6,  9, 3]
# [8,  28,  6,  0, 33, 4]
# i is the row number of the minimum element in the row
# j is the column number of the minimum
# wmins
# [1 + 3, 2 + 1, 3 + 1, 4 + 1]
# [    8,    15,     6,    33]
# [4,  3, 4,  5]
# [8, 15, 6, 33]
# i = row column index of the minimum element from row 2
# j = column index of the minimum element from row 2
# Alternatively, the function above provides a more elegant solution
minda <- function(d) {
    smallest <- min(d)
    # arr.ind returns a matrix index - row and column indices are returned
    ij <- which(d == smallest, arr.ind = TRUE)
    return(c(smallest, ij))
}
# The function above is likely slower, since it loops through the matrix twice
# However, it is more readable and more concise compared to the first iteration

# 3.6 More on the Vector/Matrix Distinction
# A matrix has two more additional attributes than a vector
# There are other subtle differences however:
z <- matrix(1:8, nrow = 4)
a <- c(1:8)
length(z)
length(a)
class(z) # Matrix
class(a) # Integer
attributes(z) # (4, 2)
attributes(a) # NULL
dim(z) # The dim() function can also obtain dimensions
dim(a)

# 3.7 Avoiding Unintended Dimension Reduction
# There are cautionary scenarios of dimension reduction
# For example:
z <- matrix(1:8, nrow = 4) # Matrix
r <- z[2, ] # Returns as a vector
attributes(z) # (4, 2)
attributes(r) # NULL
str(z)
str(r) # Clearly different from z
# The drop argument can prevent dimension reduction
r <- z[2, , drop = FALSE]
dim(r) # Shows that r is a 1 by 2 matrix
# The as.matrix() function can also convert vector results to matrices
u <- c(1, 2, 3)
v <- as.matrix(u)
attributes(u)
attributes(v)

# 3.8 Naming Matrix Rows and Columns
# Rows and columns can be named
z <- matrix(1:4, nrow = 2)
colnames(z) # NULL
colnames(z) <- c("a", "b")
rownames(z) <- c("Row 1", "Row 2")
print(z)
z[, "a"] # Use colnames to reference parts of z
z["Row 2", "a"] # 2

# 3.9 Higher Dimensional Arrays
# A typical dataset is cross-sectional - a snapshot in time of observations
# A time series requires an additional dimension
# Data sets beyond 2 dimensions are called arrays
firsttest1 <- c(46, 30)
firsttest2 <- c(21, 25)
firsttest3 <- c(50, 48)
firsttest <- matrix(c(firsttest1, firsttest2, firsttest3), nrow = 3, byrow = TRUE)
secondtest1 <- c(46, 43)
secondtest2 <- c(41, 35)
secondtest3 <- c(50, 49)
secondtest <- matrix(c(secondtest1, secondtest2, secondtest3), nrow = 3, byrow = TRUE)
# Stack the matrices
tests <- array(data = c(firsttest, secondtest), dim  = c(3, 2, 2))
attributes(tests) # There are 3 dimensions for the array
tests[3, 2, 1] # 3rd row, 2nd column, 1st layer