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
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0, 1200))

## Save the graph in png-formant as "plot1.png"