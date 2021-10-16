
dat$diff <- diff(dat$price)
dat$diff2 <- diff(dat$diff)

ddat <- as.data.frame(dat)


par(mfrow = c(2,1))
plot(dat$price, main = "Gold Monthly Price - US Dollars per Troy Ounce", ylab = "Price in USD", col = "goldenrod")
plot(diff(log(dat$price)), main = "First Order Difference of the Natural Logarithm of the Gold Price", col = "goldenrod")
plot(diff(sqrt(dat$price)), main = "First Order Difference of the Square Root of the Gold Price", col = "goldenrod")
plot(diff(1/(dat$price)), main = "First Order Difference of Reciprocal of the Gold Price", col = "goldenrod")


plot(diff(diff(log(dat$price))), main = "Second Order Difference of the Natural Logarithm of the Gold Price", col = "goldenrod")
hist(dat$perctreturn, breaks = 40, main = "Histogram of Percentual Returns", col = "goldenrod", xlab = "Monthly Return (%)")
boxplot(ddat$perctreturn, horizontal = TRUE, main = "Boxplot of Monthly Returns", xlab = "Monthly Return (%)", col = "goldenrod")

(exp(median(na.omit(dat$logreturn)))-1)*100