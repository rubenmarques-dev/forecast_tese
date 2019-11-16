
#residuos em tabela
#View dos valores de teste
# train_matrix = as.matrix(train)
# forecasted_matrix = as.matrix(fitted(result_arima))
# difference_train <- train_matrix - forecasted_matrix
# 
# train_table_difference = data.frame( train_matrix, forecasted_matrix, difference_train)
# 
# names(train_table_difference)[1] <- "train"
# names(train_table_difference)[2] <- "forecasted"
# names(train_table_difference)[3] <- "diferença"

# view(train_table_difference)


 ts <- read.csv(file='./data/dourada_decimais.csv')
# 
# acf(ts$promocao_dummy3)


train <- ts$quantidade



tsw <- ts(train, start = decimal_date(as.Date("2017-01-01")), frequency = 7)
promo1 <- ts(ts$promocao_dummy1, start = decimal_date(as.Date("2017-01-01")), frequency = 7)
promo2 <- ts(ts$promocao_dummy2, start = decimal_date(as.Date("2017-01-01")), frequency = 7)
promo3 <- ts(ts$promocao_dummy3, start = decimal_date(as.Date("2017-01-01")), frequency = 7)
zero <- ts(ts$zero_sales, start = decimal_date(as.Date("2017-01-01")), frequency = 7)


dummies <- cbind(#promo1 = as.numeric(promo1),
                  #    promo2 = as.numeric(promo2),
                      promo3 = as.numeric(promo3),
                      zeros = as.numeric(zero))


multi_ts <- msts(train, seasonal.periods=c(7,365.25))



tbats <- tbats(multi_ts)
ets <- ets(tsw)
ses <- ses(tsw)
holt<- holt(tsw)
hw <- hw(tsw)
arima <- auto.arima(tsw)
arfima <- arfima(tsw)
arimax_fit1 <- auto.arima(tsw, xreg = promo1)
arimax_fit2 <- auto.arima(tsw, xreg = promo2)
arimax_fit3 <- auto.arima(tsw, xreg = promo3)
arimax_fit4 <- auto.arima(tsw, xreg = zero)
arimax_fit5 <- auto.arima(tsw, xreg = dummies)




accuracy(tbats)
accuracy(ets)
accuracy(ses)
accuracy(holt)
accuracy(hw)
accuracy(arima)
accuracy(arimax_fit1)
accuracy(arimax_fit2)
accuracy(arimax_fit3)
accuracy(arimax_fit4)
accuracy(arimax_fit5)

