library('lubridate')

setwd("~/R/exdata-034/ExData_Plotting1")
df <- read.csv('./data/household_power_consumption.txt', sep = ";", na.strings = "?")

# Combine date and time fields into POSIXct datetime object
df$datetime <- dmy_hms(paste(df$Date, df$Time))

# subset data from the dates 2007-02-01 and 2007-02-02
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

# Plot 2: Global active power over time
png('plot2.png',  width = 480, height = 480)
par(mfrow=c(1,1))
plot(data$datetime, data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()