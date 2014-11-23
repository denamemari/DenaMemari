## makeCacheMatrix is a function for creating a Matrix 
makeCacheMatrix <- function(x = numeric()) 
            f <- NULL
            setMatrix <- function(n) {
            x <<- n
            f <<- NULL
          }
  
## set and get a valuefor Matrix, set and get an inverse for the Matrix
          getMatrix <- function() {
                x
        }
        fInverse <- function(solve) {
                f <<- solve
        }
        getInverse <- function() {
               f
        }
        
        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, fInverse = fInverse, getInverse = getInverse)
}

## function to calculate inverse of Matrix 
## initially it check to see if inverse has been calculated before, if yes it Gets it and skip the calculation steps,if No it will calculate Inverse. 
cacheSolve <- function(y, ...) {
        inverse <- y$getInverse()
        if(!is.null(inverse)) {
        message("getting cached data")
                return(inverse)
        }
        Matrix <- y$getMatrix()
        inverse <- solve(Matrix)
        y$cacheInverse(inverse)
        
        inverse
}

l <- makeCacheMatrix( matrix(c(3,2,5,10,9,52,34,3,5,45,67,43,5,21,23,46), nrow = 4, ncol = 4) );
summary(l)
l$getMatrix()
cacheSolve(l)
## this time cacheSolve has been calculated before, therefore it just going to get the inversion of Matrix 
cacheSolve(l) 
