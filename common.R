data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_path <- "household_power_consumption.zip"
txt_path <- "household_power_consumption.txt"

download_data_if_needed <- function() {
  if (file.exists(txt_path)) {
    return(invisible(txt_path))
  }

  if (!file.exists(zip_path)) {
    download.file(data_url, destfile = zip_path, mode = "wb")
  }

  unzip(zip_path, files = txt_path, overwrite = TRUE)
  invisible(txt_path)
}

load_project_data <- function() {
  download_data_if_needed()

  power_data <- read.table(
    txt_path,
    header = TRUE,
    sep = ";",
    na.strings = "?",
    stringsAsFactors = FALSE
  )

  power_data <- subset(
    power_data,
    Date %in% c("1/2/2007", "2/2/2007")
  )

  power_data$DateTime <- strptime(
    paste(power_data$Date, power_data$Time),
    format = "%d/%m/%Y %H:%M:%S"
  )

  numeric_columns <- c(
    "Global_active_power",
    "Global_reactive_power",
    "Voltage",
    "Global_intensity",
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  )

  for (column_name in numeric_columns) {
    power_data[[column_name]] <- as.numeric(power_data[[column_name]])
  }

  power_data
}
