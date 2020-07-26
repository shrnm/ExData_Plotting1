#original dataset 'household_power_consumption.txt' must be located in the working directory for the codes to work

library(data.table)

rawdata <- fread(file = "household_power_consumption.txt", na.strings = '?')
data <- subset(rawdata, rawdata$Date == '1/2/2007' | rawdata$Date == '2/2/2007')
datetime <- strptime(paste(data$Date, data$Time), format ='%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')

png(filename = 'plot3.png')
plot(datetime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'n')
lines(datetime, data$Sub_metering_1, col = 'black')
lines(datetime, data$Sub_metering_2, col = 'red')
lines(datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
