
dat$diff <- diff(dat$price)
dat$diff2 <- diff(dat$diff)

ddat <- as.data.frame(dat)



plot(dat$price, main = "Aluminium Monthly Price - US Dollars per Metric Ton", ylab = "Price in USD", col = "darkred")
plot(dat$diff, main = "First Order Difference Aluminium Price", col = "darkred")
plot(dat$diff2, main = "Second Order Difference Aluminium Price", col = "darkred")
hist(dat$perctreturn, breaks = 40, main = "Histogram of Percentual Returns", col = "darkred", xlab = "Monthly Return (%)")
boxplot(ddat$perctreturn, horizontal = TRUE, main = "Boxplot of Monthly Returns", xlab = "Monthly Return (%)", col = "darkred")

(exp(median(na.omit(dat$logreturn)))-1)*100