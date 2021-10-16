library(astsa)
library(tsbox)


#Finding the best ARIMA model
acf2(diff(log(dat$price)))

grid <- expand.grid(p = 0:3, d = 1:3, q = 0:3)
grid$aic <- rep(0, nrow(grid)) 
grid$bic <- rep(0, nrow(grid))
models <- list()


for (i in 1:nrow(grid)){
  out <- sarima(log(dat$price), p = grid$p[i], d = grid$d[i], q = grid$q[i])
  grid$aic[i] <- out$AIC
  grid$bic[i] <- out$BIC
  models[[i]] <- out$ttable
  }

result <- grid[order(grid$aic),]
result2 <- grid[order(grid$bic),]

models[[as.numeric(rownames(head(result,1)))]]
models[[as.numeric(rownames(tail(head(result,2),1)))]]

acf2(diff(log(dat2006)))

grid$aic2006 <- rep(0, nrow(grid)) 
grid$bic2006 <- rep(0, nrow(grid))
models2006 <- list()

for (i in 1:nrow(grid)){
  out <- sarima(log(dat2006$price), p = grid$p[i], d = grid$d[i], q = grid$q[i])
  grid$aic2006[i] <- out$AIC
  grid$bic2006[i] <- out$BIC
  models2006[[i]] <- out$ttable
}

result <- grid[order(grid$aic2006),]
result2 <- grid[order(grid$bic2006),]

models2006[[as.numeric(rownames(head(result,1)))]]
models2006[[as.numeric(rownames(tail(head(result,2),1)))]]

#Forecasting
datts <- ts_ts(dat$price)
dat1 <- window(datts, end = 2018)
dat2 <- window(datts, end = 2020)

par(mfrow=c(2,1))
sarima.for(dat1, n.ahead = 24, 0, 1, 1)
lines(dat2)

sarima.for(dat1, n.ahead = 24, 1, 1, 1)
lines(dat2)

dat2006ts <- ts_ts(dat2006)
dat061 <- window(dat2006ts, end = 2018)
dat062 <- window(dat2006ts, end = 2020)

sarima.for(dat061, n.ahead = 24, 0, 1, 1)
lines(dat062)

sarima.for(dat061, n.ahead = 24, 3, 1, 2)
lines(dat062)

sarima.for(datts, n.ahead = 24, 1, 1, 1)

sarima.for(dat2006ts, n.ahead = 24, 0, 1, 1)

