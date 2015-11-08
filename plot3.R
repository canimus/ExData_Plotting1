# For Local Environment
setwd("/sw/coursera/exploratorydata/prj1/ExData_Plotting1")

# Read data set from Project 1
# ? are used as NA as described in the exercise
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

# Convert dates from initial column
data$Date <- as.Date(data$Date , "%d/%m/%Y")

# Create a subset for the target analysis samples
df <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Unify date and time in a single column
dt <- paste(df$Date, df$Time)
df$DateTime <- strptime(dt, "%Y-%m-%d %H:%M:%S")

# Main plot function
# Adds a new file device and flush content to file with PNG format
png("plot3.png", width=480, height=480, units="px", type="quartz")

plot(df$DateTime, df$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_1, col = "black")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

# Make sure information is flush on device
dev.flush()

# Close device
dev.off()
