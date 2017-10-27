# R tutorial

## Using Swirl to Learn R in R
install.packages("swirl")
library(swirl)
?swirl
swirl

## Getting Help in R

# R Help: *help()* and *?*
  
  
# help(lm)
# ?lm
# ?"lm" # The quotes are optional
# ?help
# help(rlm, package="MASS")
# help(package="MASS")
# example(lm) # execute examples in the current R session



## Data Types in R

# The *<-* symbol is the assignment operator.
# The *c()* function can be used to create vectors of objects.
# The *:* operator is used to create integer sequences.
# The *#* is for comment, the code behind the # would be ignored.
# The *class()* function can be used to check the class of an object.

### Vector

x <- c(0.5, 0.6)    ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F)  ## logical
A <- c("a", "b", "c") ## character
class(A) ## print the class of A
print(A) ## print the value of A
B <- 9:29 ## integer
class(B) ## Chenk the class of B
C <- c(A, B) # Mixing Object
class(C)
C
## When different objects are mixed in a vector,
## coercion occurs so that every element
## in the vector is of the same class
x <- c(1+0i, 2+4i) ## complex


### Explicit Coercion
# Objects can be explicitly coerced from one to another using as.* fucntions, if available. Nonsensical coercion results in NAs.

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# Nonsensical coercion
x <- c("a","b","c")
as.numeric(x)
as.logical(x)


### Matrics
# Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (nrow, ncol)

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m) # attributes can be check the attributes of R Objects


# Matrices can also be created directly from vectors by adding a dimension attribute.


m <- 1:10 # Actually array is a special matrix
m
dim(m) <- c(2,5)
m


# Matrices can be created by **column-binding** or **row-binding** with *rbind()* and 


x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)


### Lists
# Lists are a special type of vector that can contain elements of different classes.

x <- list(1, "a", TRUE, 1 + 4i)
x
y <- list(x, list("c", 32, FALSE))
y

### Factors
# Factors are used for represent categorical data. One can think of a factor as an integer vector where each integer has a *label*
  
  
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)


### Missing Values
# Missing values are denoted by *NA* or *NaN* for undefined mathematical operations.
# *is.na* is used to test objects if they are *NA*
#   *is.nan* is used to test objects if they are *NaN*
#   *NA* have a class also, such as integer of character
# *NaN* is also  *NA* but the converse is not true

x <- c(1, 2, NA, 10, NaN)
is.na(x)
is.nan(x)


### Data Frames
# Data frames actually are matrices which can store different classes of objects in each column. But elements within each column would be with the same class. One can think of a data frame as a matrix consist of vectors of different classes.


x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)
colnames(x)
names(x) # names() can be applied to any R basic objects.


### Subsetting
# There are a number of operators can be used to extract subsets of R objects.
# *[* always returns an object of the same class as the original; can be used to select more than one element.
#   *[[* is used to extract elements of a list or data frame;
#      *$* is used to extract elements of a list or data frame by name; semantic are similar to hat of *[[*
                                                                                                          
                                                                                                          
x <- c("a", "b", "c", "d")
x[1]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]

# Subsetting a Matrix

x <- matrix(1:6, 2, 3)
x[1,2]
x[1:2, 2:3]
x[2, 1:2]
x[1,]
x[,2]


# Subsetting a List

x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]
x <- list(foo = 1:4, bar = 0.6, baz="hello")
x[c(1,3)]



x <- list(foo = 1:4, bar = 0.6, baz="hello")
name <- "foo"
x[[name]] ## computed index for 'foo'
x$name ## element 'name' doesn't exist!
x$foo


# Subsetting Nested Elements of a List

x <- list(a = list(10, 12, 14), b = c (3.14, 2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]


### Removing *Na*s
# Useful functions: *is.na()*, *complete.cases()*, *na.omit()*, *is.nan()* ...

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]


## Control Structures

# *if else*, *for*,*while*
  
  ### if
  
a = -1
b = 1
if(a > b){
  print(a)
}else if(b > a){
  print(b)
}else{
  print("equal")
}


### for

a = c(-1,2,-4,5,6,-7,11.5,-32)
for(i in 1:length(a)){
  if(a[i] < 0){
    a[i] = -a[i]
  }
}
# Can you improve the algorithm using subsetting?


### while

a = c(-1,2,-4,5,6,-7,11.5,-32)
i = length(a)
while(i > 0){
  print(a[i])
  i <- i -1
}


## Functions

# Functions is processes.


# write a function return the maximum value of two elements
max_user <- function(input1, input2){
  if (input1 > input2){
    return(input1)
  }else{
    return(input2)
  }
}

max_user(1,2)

max_user(3,2)