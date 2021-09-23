# Chapter 4: Lists
# Lists are a special type of vector where elements are different modes
# Many functions that work on vectors and matrices also work on lists

# 4.1 Creating Lists
# Lists are a special type of recursive vector
# Consider an employee database contains information for each employee
# Suppose names, salaries, and union membership are contained in the database
# An employee can be represented by a list object
j <- list(name = "Joe", salary = 55000, union = 1)
# Show the components of j
print(j)
print(j$salary)
# The tags are optional
jalt <- list("Joe", 55000, T)
print(jalt)
print(jalt[[1]])
# List are vectors, so the vector() funtion can create lists
z <- vector(mode = "list")
z["abc"] <- 3
print(z)

# 4.2 General List Operations
# 4.2.1 List Indexing
# Access to a list component can be done in multiple ways
print(j$salary)
print(j[salary])
print(j[[2]]) # Double brackets are used for lists
# Single brackets are allowed but the mode of the element returned is a list
# For example
print(j[1])
print(mode) # list
print(j[[name]])
print(mode) # character
# Another example
print(j[1:2])
j2 <- j[2]
print(j[2])
print(class(j[2]))

# 4.2.2 Adding and Deleting List Elements
# New components can be added without resizing the list
z <- list(a = "abc", b = 12)
print(z)
z$c <- "sailing" # Add component c with value "sailing"
print(z)
# As usual, tags are optional
z[[4]] <- 28
z[5:7] <- c(FALSE, TRUE, TRUE)
print(z)
# Delete a component by setting it to NULL
z$b <- NULL
print(z) # Note that the indices of the elements shift up after b is deleted
# Lists can be concatenated
print(c(list("Joe", 55000, T), list(5)))

# 4.2.3 Getting the Size of a List
# The length() function can be used on lists to get the number of components
print(length(j))

# 4.2.4 Extended Example: Text Concordance
# Given a text file, count the occurrences of each word in a text file
# Refer to files testconcord.txt and testconcorda.txt
findwords <- function(tf) {
    # Read in the words from the file, into a vector of mode character
    text <- scan(tf, "")
    # Create an empty list
    wl <- list()
    # Loop through th e vector containing all the words
    for (i in 1:length(txt)) {
        wrd <- text[i]
        # Make note of where the word occurred in the file
        wl[[word]] <- c(wl[[wrd]], i)
    }
}

4.3 Accessing List Components and Values
# The tags of a list can be obtained with the names() function
names(j)
ulj <- unlist(j) # Get the corresponding values in vector form
# The unlist() function converts elements to the lowest common denominator
w <- list(a = 5, b = "xyz")
wu <- unlist(w)
print(class(wu))
print(wu)
# The vector returned by the unlist() function has names that can be removed
names(wu) <- NULL
print(wu)
# The unname() function works as well in removing names
wun <- unname(wu)
print(wun)

# 4.4 Applying Functions to Lists
# The lapply() and sapply() are useful functions to apply functions to lists

# 4.4.1 Using the lapply() and sapply() Functions
# The lapply() function works similarly to the apply() function
# The major difference is the lapply() returns a list
print(lapply(list(1:3, 25:29), median))
# Returns a list of two medians for the vectors 1:3 amd 25:29
# The sapply() function is functionally the same as lapply()
# However, the return value is simplified to a vector or matrix if possible
print(sapply(list(1:3, 25:29), median))
print(mode(sapply(list(1:3, 25:29), median)))

# 4.4.2 Extended Example: Text Concordance, Continued
# The findwords() function shown above returns a list of word locations
# However, the order in which words appear in the list is unsorted
# To present the list in alphabetical order:
# Sorts wrdlst, the output of findwords() alphabetically by word
alphawl <- function(wrdlst) {
    nms <- names(wrdlst) # Obtain the words in the list
    sn <- sort(nms) # Sort the words alphabetically
    # Return a sublist using list indexing
    return(wrdlst[sn]) # Return the rearranged version of the list
}
# The list can also be sorted by word frequency
freqwl <- function(wrdlst) {
    # A vector containing the number of occurrences for each word
    freqs <- sapply(wrdlst, length)
    # Return a sublist using list indexing
    # order() function returns indices of a sorted vector given the original
    # An example: x <- c(12, 5, 13, 8)
    # order(x) returns (2, 4, 1, 3) - element 2 is the smallest and element 3 is the largest
    return(wrdlst[order(freqs)]) # Return the rearranged version of the list
}

4.4.3 Extended Example: Back to the Abalone Data
# Revisiting a previous example, lapply() on vectors
# Prior example - determine the indices of a given gender given observations
g <- c("M", "F", "F", "I", "M", "M", "F")
# lapply() will return a list here
print(lapply(c("M", "F", "I"), function(gender) which(g == gender)))

4.5 Recursive Lists
# Lists can be nested within lists - these lists are called recursive lists
b <- list(u = 5, v = 12)
c <- list(w = 13)
a <- list(b, c)
print(a) # Recursive list
# The recursive argument for the concatenate function c() "flattens" the list
print(c(list(a = 1, b = 2, c = list(d = 5, e = 9))))
print(c(list(a = 1, b = 2, c = list(d = 5, e = 9)), recursive = TRUE))