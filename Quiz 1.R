data <- read.csv("~/Downloads/hw1_data.csv")
data
Ozone <- data["Ozone"]
OzoneNa <- is.na(Ozone)
good <- complete.cases(data)
data2 <- data[good, ]
data2
Ozone2 <- data2["Ozone"] > 30
Temp2 <- data2["Temp"] > 90
Month2 <- data["Month"] == 5
data <- data[Month2,]
data
mean(data[["Temp"]])

