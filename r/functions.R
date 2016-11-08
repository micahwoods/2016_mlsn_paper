# generates an mlsn value for a vector using log logistic distribution
mlsn <- function(x) {
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  new.mlsn <- qfisk(0.1, z[1], z[2])
  return(round(new.mlsn, 0))
}

# generates an mlsn value for a vector using a normal distribution
mlsn.normal <- function(x) {
  v1 <- qnorm(0.1, mean = mean(x), sd = sd(x))
  return(round(v1, 0))
}

# generates of row of summary data in a table for a given vector
rowData <- function(x) {
  ano <- c(mlsn(x), 
           min(x, na.rm = TRUE),
           median(x, na.rm = TRUE),
           max(x, na.rm = TRUE))
  return(ano)
}

# show mlsn value & the shape and scale
shapeScale <- function(x) {
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  new.mlsn <- qfisk(0.1, z[1], z[2])
  scale <- z[1]
  shape <- z[2]
  ano <- c(scale, shape, new.mlsn)
  return(ano)
}

# SI function for the log-logistic distribution
# x is the test result, y is the MLSN data vector
# update this to match previous, as 1 - the cdf

siFisk <- function(x, y) {
  fit.y <- vglm(y ~ 1, fisk)
  z <- Coef(fit.y)
  si <- 1 - pfisk(x, z[1], z[2])
  return(si)
}
  