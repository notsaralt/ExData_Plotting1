electric_data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = c("?"), stringsAsFactors = FALSE)
electric_data$Formatted_Date <- as.Date(electric_data$Date, "%d/%m/%Y")





date1 <- as.Date('01/02/2007', "%d/%m/%Y")
date2 <- as.Date('02/02/2007', "%d/%m/%Y")

electric_data <- subset(electric_data, Formatted_Date == date1 | Formatted_Date == date2)
electric_data$Date_Time <- strptime(paste(electric_data$Date, electric_data$Time), format = "%d/%m/%Y %H:%M:%S") 

png('plot2.png', width = 480, height = 480, units = 'px')
plot(electric_data$Date_Time, electric_data$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = '', type = 'n')
lines(electric_data$Date_Time, electric_data$Global_active_power)

dev.off()