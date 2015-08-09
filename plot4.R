electric_data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = c("?"), stringsAsFactors = FALSE)
electric_data$Formatted_Date <- as.Date(electric_data$Date, "%d/%m/%Y")




date1 <- as.Date('01/02/2007', "%d/%m/%Y")
date2 <- as.Date('02/02/2007', "%d/%m/%Y")

electric_data <- subset(electric_data, Formatted_Date == date1 | Formatted_Date == date2)
electric_data$Date_Time <- strptime(paste(electric_data$Date, electric_data$Time), format = "%d/%m/%Y %H:%M:%S") 

png('plot4.png', width = 480, height = 480, units = 'px')


par(mfcol = c(2,2))

## plot in pos (1,1)
plot(electric_data$Date_Time, electric_data$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = '', type = 'n')
lines(electric_data$Date_Time, electric_data$Global_active_power)



## plot in pos (2, 1)
plot(electric_data$Date_Time, electric_data$Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'n')
lines(electric_data$Date_Time, electric_data$Sub_metering_1, col = 'black')
lines(electric_data$Date_Time, electric_data$Sub_metering_2, col = 'red')
lines(electric_data$Date_Time, electric_data$Sub_metering_3, col = 'blue')

line_names <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', legend = line_names,  col = c('black', 'red', 'blue'), lwd = 1)


## plot in pos (1,2)
plot(electric_data$Date_Time, electric_data$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'n')
lines(electric_data$Date_Time, electric_data$Voltage)


##plot in pos (2, 2)
## plot in pos (1,2)
plot(electric_data$Date_Time, electric_data$Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime', type = 'n')
lines(electric_data$Date_Time, electric_data$Global_reactive_power)



dev.off()