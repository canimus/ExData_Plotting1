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