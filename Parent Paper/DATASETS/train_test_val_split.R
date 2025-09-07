library(rsample)

timeseries_data <- read.csv("day_approach_maskedID_timeseries.csv")

# First split: 70% training, 30% temp (val + test)
split_1 <- initial_time_split(timeseries_data, prop = 0.7)
train <- training(split_1)
temp  <- testing(split_1)

# Second split: 50% of temp → validation, 50% → test
split_2 <- initial_time_split(temp, prop = 0.5)
val  <- training(split_2)
test <- testing(split_2)

write.csv(train, "train.csv", row.names=F)
write.csv(test, "test.csv", row.names=F)
write.csv(val, "validation.csv", row.names=F)