## Set up the working directory (as comment for project purposes)
## setwd("C:/Users/Jani/Desktop/R-programming/Rdocuments/Exploratory data analysis/exdata_data_household_power_consumption")


data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(data) <- name
date.time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
  data[[i]] <- sapply(data[[i]], as.character)
  data[[i]] <- sapply(data[[i]], as.numeric)
}
win.graph(400,400)
with(data, plot(date.time, Sub_metering_1, type = "n", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE))
axis(1, at=c(as.numeric(min(date.time)), as.numeric(min(date.time))+86400
             , as.numeric(min(date.time))+172800), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")

with(data, points(date.time, Sub_metering_1, type = "l"))
with(data, points(date.time, Sub_metering_2, type = "l", col = "red"))
with(data, points(date.time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

