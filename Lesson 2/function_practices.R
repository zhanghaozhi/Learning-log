add2 <- function(x, y){
  x + y
}

above10 <- function(x){
  x[x > 10]
}

above <- function(x, n = 10 ##default could be changed
){
  x[x > n]
}

colummean <- function(y, 
                      removeNA = TRUE #Remove NA value
){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[ ,i],
                     na.rm = removeNA #  indicating whether NA values should be stripped before the computation proceeds.
    )
  }
  means
}
    


