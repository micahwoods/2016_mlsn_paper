# make histogram figure for the MLSN paper

fiskHist <- function(zed, xLabInput) {
  
myhist <- hist(zed, breaks = 40, plot = FALSE)

multiplier <- myhist$counts / myhist$density
mydensity <- density(zed, na.rm = TRUE)
# I reduce with a factor of 0.94 so that all the curves remain on plot
mydensity$y <- mydensity$y * multiplier[1] * 0.94

myx <- seq(min(zed, na.rm = TRUE), max(zed, na.rm = TRUE), length.out = 200)
mymean <- mean(zed, na.rm = TRUE)
mysd <- sd(zed, na.rm = TRUE)
normal <- dnorm(x = myx, mean = mymean, sd = mysd)

hist(zed, breaks = 40, main = NULL, xlab = bquote(paste(.(xLabInput), ~kg^{-1}*")")), 
     cex.lab = 1.5, cex.axis = 1.5, cex.main = 1.5, cex.sub = 1.5)
lines(mydensity, col = "#7570b3", lwd = 2, main = NULL, lty = 1)
lines(myx, normal * multiplier[1] * 0.94, col = "#d95f02", lwd = 2, main = NULL, lty = 2)

fit.x <- vglm(zed ~ 1, fisk)
z <- Coef(fit.x)
fisk.nums <- dfisk(myx, z[1], z[2])


lines(myx, fisk.nums * multiplier[1] * 0.94, col = "#1b9e77", lwd = 2, main = NULL, lty = 6)

}

par(mfrow=c(3,2))
par(mar=c(5.1,4.1,4.1,2.1))
fiskHist(potassium, "K (mg")
fiskHist(phosphorus, "P (mg")
fiskHist(calcium, "Ca (mg")
fiskHist(magnesium, "Mg (mg")
fiskHist(sulfur, "S (mg")

plot(x = 0, y = 0, type='n', bty='n', xaxt='n', yaxt='n',
     xlab = "", ylab = "")

legend("center",
       c("density", "normal", "log-logistic"),
       col=c("#7570b3", "#d95f02", "#1b9e77"),
       lwd = 2, lty = c(1, 2, 6), bty = "n",
       cex = 1.5)
