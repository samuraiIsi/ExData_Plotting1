source("common.R")

power_data <- load_project_data()

png("plot1.png", width = 480, height = 480)
hist(
  power_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)
dev.off()
