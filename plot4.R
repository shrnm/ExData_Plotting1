#original dataset 'household_power_consumption.txt' must be located in the working directory for the codes to work

library(data.table)

rawdata <- fread(file = "household_power_consumption.txt", na.strings = '?')
data <- subset(rawdata, rawdata$Date == '1/2/2007' | rawdata$Date == '2/2/2007')
datetime <- strptime(paste(data$Date, data$Time), format ='%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')

png(filename = 'plot4.png')
par(mfrow = c(2,2))

plot(datetime, data$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'n')
lines(datetime, data$Global_active_power)

plot(datetime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'n')
lines(datetime, data$Voltage)

plot(datetime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'n')
lines(datetime, data$Sub_metering_1, col = 'black')
lines(datetime, data$Sub_metering_2, col = 'red')
lines(datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, bty = 'n', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

with(data, {plot(datetime, Global_reactive_power, type = 'n')
                lines(datetime, Global_reactive_power)})

dev.off()

