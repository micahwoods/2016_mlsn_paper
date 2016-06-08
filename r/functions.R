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

# omcec function calculates om cec for given pH (x) and om (y)
omcec <- function(x, y) {
  cec <- (-311 + 268 * x) * (y / 100)
  return(round(cec, 1))
}

# generates of row of summary data in a table for a given vector
rowData <- function(x) {
  ano <- c(length(na.omit(x)), 
           mlsn(x), 
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
  