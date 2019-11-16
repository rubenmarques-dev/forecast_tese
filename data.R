data <- read.csv(file='./data/qty_promotion.csv')

series <- ts(data, start=1, end=113 + 4/7, frequency=7)

train <- window(y, start=1, end=105 + 1/7 ,frequency=7)
test <- window(y, start=105 + 2/7, end=113 + 4/7, frequency = 7)
