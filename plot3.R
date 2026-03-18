source("common.R")

power_data <- load_project_data()
axis_ticks <- as.POSIXct(
  c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
  tz = ""
)

png("plot3.png", width = 480, height = 480)
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
  bty = "n"
)
dev.off()
