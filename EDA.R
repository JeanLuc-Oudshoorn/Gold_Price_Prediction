
dat$diff <- diff(dat$price)
dat$diff2 <- diff(dat$diff)

ddat <- as.data.frame(dat)



plot(dat$price, main = "Gold Monthly Price - US Dollars per Troy Ounce", ylab = "Price in USD", col = "goldenrod")
plot(dat$diff, main = "First Order Difference Gold Price", col = "goldenrod")
plot(dat$diff2, main = "Second Order Difference Gold Price", col = "goldenrod")
hist(dat$perctreturn, breaks = 40, main = "Histogram of Percentual Returns", col = "goldenrod", xlab = "Monthly Return (%)")
boxplot(ddat$perctreturn, horizontal = TRUE, main = "Boxplot of Monthly Returns", xlab = "Monthly Return (%)", col = "goldenrod")

(exp(median(na.omit(dat$logreturn)))-1)*100