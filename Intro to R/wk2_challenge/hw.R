## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## using <<- to scope up...
## then writing get and set functions pushing the value of "invert" up and saving it so it is accesible by cacheSolve
makeCacheMatrix <- function(x = matrix()) {
    invert <- NULL
    set <- function(y){
        x <<- y
        invert <<- NULL
    }
    get <- function() x
    setmatrix <- function(inverse) invert <<- inverse
    getmatrix <- function() invert
    list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

## Write a short comment describing this function

##uses getmatrix to check if invert is already saved
##uses setmatrix from the first function to to set value to cache for future runs
cacheSolve <- function(x, ...) {
    invert <- x$getmatrix()
    if(!is.null(invert)){
        message("fetching cached data!")
        return(invert)
    }
    matrix <- x$get()
    invert <-solve(matrix)
    x$setmatrix(invert)
    invert
}

x = rbind(c(1, -1/2), c(-1/2, 1))
test <- makeCacheMatrix( x )
cacheSolve(test)



# > x = rbind(c(1, -1/2), c(-1/2, 1))
# > test <- makeCacheMatrix( x )
# > cacheSolve(test)
#           [,1]      [,2]
# [1,] 1.3333333 0.6666667
# [2,] 0.6666667 1.3333333
# > cacheSolve(test)
# fetching cached data!
#           [,1]      [,2]
# [1,] 1.3333333 0.6666667
# [2,] 0.6666667 1.3333333
