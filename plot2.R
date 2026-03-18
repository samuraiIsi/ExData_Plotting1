source("common.R")

power_data <- load_project_data()
axis_ticks <- as.POSIXct(
  c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
  tz = ""
)

png("plot2.png", width = 480, height = 480)
plot(
  power_data$DateTime,
  power_data$Global_active_power,
  type = "l",
  xaxt = "n",
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
  xlim = range(axis_ticks)
)
axis(1, at = axis_ticks, labels = c("Thu", "Fri", "Sat"))
dev.off()
