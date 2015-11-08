library('lubridate')

setwd("~/R/exdata-034/ExData_Plotting1")
df <- read.csv('./data/household_power_consumption.txt', sep = ";", na.strings = "?")

# Combine date and time fields into POSIXct datetime object
df$datetime <- dmy_hms(paste(df$Date, df$Time))

# subset data from the dates 2007-02-01 and 2007-02-02
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

# Plot 4: Combined plot
attach(data)

png('plot4.png',  width = 480, height = 480)
par(mfrow=c(2,2))

# topleft: Global active power over time
plot(datetime, Global_active_power, type="l", xlab="")

# topright: Voltage over time
plot(datetime, Voltage, type="l")

# bottomleft: Energy sub metering over time
plot(datetime, Sub_metering_1,
     xlab = "",
     ylab="Energy sub metering",
     type="l")

lines(datetime, Sub_metering_2,
      col="red")

lines(datetime, Sub_metering_3,
      col="blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty="n")

# bottomright: Global active power over time
plot(datetime, Global_reactive_power, 
     type="l")

dev.off()

detach(data)

