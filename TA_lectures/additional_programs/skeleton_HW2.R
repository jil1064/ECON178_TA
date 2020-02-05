### Exercise 1  


## Part 1: generate data 

set.seed(123)
n <- 100
p <-  99
x <- matrix(runif(n*p, min=-100,max=100), n , p)

## Generate the output variable as a linear combination of x

## With jitter() you add random noise
y <-  jitter(3 + 10*x[,99], factor=10000)


## Complete the exercise to compute the out of sample prediction error 
## Call the outof sample prediction error MSPE





###
print(MSPE)


### Compute 99 different models

MSPE <- rep(NA, 99)
## Store each error in the vector MSPE
## each entry corresponds to variables 1 to 99
### ...




### Plot 
plot(MSPE ~ c(1:99))




### Exercise 2 



## Open white wine data


## Skeleton   CV   ###################################################

 data <-
  y <-
  K <-
#  
#  
set.seed(123)
#
n <- nrow(data)
predictions <- numeric(n)
#
#
ii <- sample(rep(1:K, length = n))

for (i in 1:K) {
  hold <- (ii == i)
  train <- (ii != i)
##
## Build model
##

## Store the predictions for the left-out segment
 predictions[hold] <-
}
## Calculate estimated MSPE
mean((y - predictions)^2)



## Exercise 3 



student <- read.table("./data/student.matG.txt")

### Discuss two models and justify the models using the following lines 


## Comment below
##
##
##


## Construct the ridge regression


xm <- model.matrix(~. ,data=student[,-27])[,-1]  
y <- student[,27]

## Use this functions to standardize

standard_for_dummy <- function (k){ if (length(k[!duplicated(k)])==2)
{ return(1)}                               
  return(sd(k))                                                      }

sd.tr <- apply(xm, 2, standard_for_dummy) 

mu_for_dummy <- function (k){ if (length(k[!duplicated(k)])==2)
{ return(0.5)}                               
  mean(k)      }

mu.tr <-apply(xm, 2, mu_for_dummy) 

## New covariate matrix


xmn <- scale(xm, center = mu.tr, scale=sd.tr)

## Set your lambda 

lambdas.rr <- exp(seq(-4, 4, length=50))
library(glmnet)


## Run ridge regression


## Do cross validation and compare to linear models 






