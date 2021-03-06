# for figure 2, ecdf of data and then of modeled data
# set.seed at MLSN by letter of alphabet, thus 13,12,19,14 13121914

# write function to make an ECDF for an element
# x is vector to plot, zed is the axis label

# put outside function so is defined globally
col2 <- adjustcolor("grey", alpha.f = 0.6)  

ecdfPlot <- function(zed, xLabInput) {
  
# col2 to be for the data
# trying to make clearer distinction between data and model
  

fit.x <- vglm(zed ~ 1, fisk)
z <- Coef(fit.x)

set.seed(13121914)
sim.data <- data.frame(y = rfisk(n = length(na.omit(zed)),
                                 z[1], z[2])) 

# makes a plot

plot(ecdf(zed), verticals=TRUE, do.p=FALSE,
     col.h = col2,
     col.v = col2, 
     main = NULL, xlab = bquote(paste(.(xLabInput), ~kg^{-1}*")")),
     cex.lab = 1.5, cex.axis = 1.5, cex.main = 1.5, cex.sub = 1.5)

lines(ecdf(sim.data$y), verticals = FALSE,
      col.h = "#1b9e77",
      col.v = "#1b9e77")

}

normalEcdfPlot <- function(zed, xLabInput) {
  
  meanData <- mean(zed, na.rm = TRUE)
  sdData <- sd(zed, na.rm = TRUE)
  
  set.seed(13121914)
  sim.data <- data.frame(y = rnorm(length(na.omit(zed)),
                                   meanData, sdData))
  
  # makes a plot
  
  plot(ecdf(zed), verticals=TRUE, do.p=FALSE,
       col.h = "#d95f02",
       col.v = "#d95f02",
       main = NULL, xlab = bquote(paste(.(xLabInput), ~kg^{-1}*")")),
       cex.lab = 1.5, cex.axis = 1.5, cex.main = 1.5, cex.sub = 1.5)
  
  lines(ecdf(sim.data$y), verticals=TRUE,
        col.h = "black",
        col.v = "black")
  
}

par(mfrow=c(3,2))
par(mar=c(5.1,4.1,4.1,2.1))
ecdfPlot(potassium, "K (mg")
ecdfPlot(phosphorus, "P (mg")

# pre-2016 worked with normal for Ca
# in 2016 switch to log-logistic
# normalEcdfPlot(calcium, "Ca (mg")
ecdfPlot(calcium, "Ca (mg")

ecdfPlot(magnesium, "Mg (mg")
ecdfPlot(sulfur, "S (mg")

plot(x = 0, y = 0, type='n', bty='n', xaxt='n', yaxt='n',
     xlab = "", ylab = "")

# col <- c("#d95f02", "#1b9e77")

legend("center", c("data", "MLSN model"),
       col = c(col2, "#1b9e77"),
       lty = 1,
       lwd = 1,
       bty = "n",
       cex = 1.5)
