#original dataset 'household_power_consumption.txt' must be located in the working directory for the codes to work

library(data.table)

rawdata <- fread(file = "household_power_consumption.txt", na.strings = '?')
data <- subset(rawdata, rawdata$Date == '1/2/2007' | rawdata$Date == '2/2/2007')
datetime <- strptime(paste(data$Date, data$Time), format ='%d/%m/%Y %H:%M:%S', tz = 'Europe/Paris')

png(filename = 'plot2.png')
plot(datetime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'n')
lines(datetime, data$Global_active_power)
dev.off()
