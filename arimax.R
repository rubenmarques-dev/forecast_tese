library(forecast)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(fpp2)


#loading datasets and timeseries

data <- read.csv(file='./data/totais_diarios.csv')

y <- ts(data)


train <- window(y, start=1,end=730, frequency=7)
test <- window(y, start=731, end=  , frequency=7)




length(train)
length(test)
#autoplot(y)
#autoplot(promo)

arima_fit <- auto.arima(train)





checkresiduals(arima_fit)


result_arima <- forecast(arima_fit,h = 60)



accuracy(result_arima,test)



autoplot(test, series='test') +
  autolayer(result_arima, PI=FALSE, series="Arima results") +
  xlab("week") +
  ylab("Value") +
  ggtitle("Qty sell") +
  guides(colour=guide_legend(title="Forecast"))