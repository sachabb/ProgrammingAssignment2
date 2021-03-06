## Put comments here that give an overall description of what your
## functions do

## The set() function takes a matrix as input and stores it in the 'matrix' variable, while also resetting the 'inverse' variable to NULL.
## The get() function returns the value of the matrix stored in the 'matrix' variable.
## The setinverse() function takes the inverted matrix as input and stores it in the 'inverse' variable.
## The getinverse() function returns the inverted matrix stored in the 'inverse' variable.

## Write a short comment describing this function

makeCacheMatrix <- function(matrix = matrix()) {
	inverse <- NULL
	
	set <- function(newMatrix) {
		matrix <<- newMatrix
		inverse <<- NULL
	}
	get <- function() matrix
	
	setinverse <- function(newInverse) inverse <<- newInverse
	getinverse <- function() inverse
	
	list(set = set, get = get,
		 setinverse = setinverse,
		 getinverse = getinverse)
}


## Write a short comment describing this function

## The cacheSolve() function takes a 'cacheMatrix' object created using the first function and checks if it has a value other than NULL in its 'inverse' variable.
## 		If 'inverse' is NULL, the solve() function is used to get the inverse of the matrix returned from 'cacheMatrix$get()'. The result of solve() is stored using the object's setinverse() function.
##		Finally, the function returns the inverted matrix, wether from the cache or from using solve().

cacheSolve <- function(cacheMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- cacheMatrix$getinverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- cacheMatrix$get()
        inverse <- solve(data, ...)
        cacheMatrix$setinverse(inverse)
        inverse
}
