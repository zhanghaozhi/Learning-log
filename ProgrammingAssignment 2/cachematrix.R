## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
## Your assignment is to write a pair of functions that cache the inverse of a matrix.

## The first function, makeCacheMatrix creates a special "vector", 
## which is really a list containing a function to:
## set the value of matrix, get the value of matrix, 
## set value of inverse, and get hte value of inverse
## 

# define the first function, notice the x was define here as matrix
makeCacheMatrix <- function(x = matrix()) {
    # define m as Null in every cycle of running
    m <- NULL
    # define set function
    set <- function(y) {
      # assign another argument y to x
      x <<- y
      # rest m as NULL
      m<<- NULL
    }
    # define get as the function to print out x matrix
    get <- function() x
    # define setinverse as the function to assign the solve function to m in the parrent environment
    setinverse <- function(solve) m <<- solve
    # define getinverse as the function to print out m
    getinverse <- function() m
    # give names to all functions for next step's subsetting
    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


##  calculates/retrieve the inverse of the special "matrix" created with the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    # retrieve the inverse value from the former makeCacheMatrix function by subsetting
    m <- x$getinverse()
    # Check is inverse was calculated or not to see if m equals or not equals to null
    if(!is.null(m)){
        message("getting cached data")
        return(m)
        #Getting cached data from former calculation
    }
    # if m = null, need the new calculation start from here
    # get the data x by calling the sub-fuction in former function
    data <- x$get()
    # the real calculation of inverse happens here
    m <- solve(data, ...)
    # write or cache m in former function
    x$getinverse(m)
    # print out m
    m
}









