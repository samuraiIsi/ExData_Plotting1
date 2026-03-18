source("common.R")

power_data <- load_project_data()
axis_ticks <- as.POSIXct(
  c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
  tz = ""
)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(
  power_data$DateTime,
  power_data$Global_active_power,
  type = "l",
  xaxt = "n",
  xlab = "",
  ylab = "Global Active Power",
  xlim = range(axis_ticks)
)
axis(1, at = axis_ticks, labels = c("Thu", "Fri", "Sat"))

plot(
  power_data$DateTime,
  power_data$Voltage,
  type = "l",
  xaxt = "n",
  xlab = "datetime",
  ylab = "Voltage",
  xlim = range(axis_ticks)
)
axis(1, at = axis_ticks, labels = c("Thu", "Fri", "Sat"))

plot(
  power_data$DateTime,
  power_data$Sub_metering_1,
  type = "l",
  xaxt = "n",
  xlab = "",
  ylab = "Energy sub metering",
  xlim = range(axis_ticks)
)
lines(power_data$DateTime, power_data$Sub_metering_2, col = "red")
lines(power_data$DateTime, power_data$Sub_metering_3, col = "blue")
axis(1, at = axis_ticks, labels = c("Thu", "Fri", "Sat"))
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n",
  cex = 0.8
)

plot(
  power_data$DateTime,
  power_data$Global_reactive_power,
  type = "l",
  xaxt = "n",
  xlab = "datetime",
  ylab = "Global_reactive_power",
  xlim = range(axis_ticks)
)
axis(1, at = axis_ticks, labels = c("Thu", "Fri", "Sat"))

dev.off()
