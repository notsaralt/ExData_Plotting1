electric_data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = c("?"))
electric_data$Date <- as.Date(electric_data$Date, "%d/%m/%Y")

date1 <- as.Date('01/02/2007', "%d/%m/%Y")
date2 <- as.Date('02/02/2007', "%d/%m/%Y")

electric_data <- subset(electric_data, Date == date1 | Date == date2)

hist(electric_data$Global_active_power, xlab = 'Global Active Power (kilowatts)', col = 'red', main = 'Global Active Power')

dev.copy(png, './plot1.png')
dev.off()