#original dataset must be located in the working directory for the codes to work

library(data.table)

rawdata <- fread(file = "household_power_consumption.txt", na.strings = '?')
data <- subset(rawdata, rawdata$Date == '1/2/2007' | rawdata$Date == '2/2/2007')

png(filename = 'plot1.png')
hist(data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()
