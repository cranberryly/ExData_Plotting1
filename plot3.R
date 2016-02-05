## Getting Data
setwd("~/Desktop/Coursera_EDA")
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(),"household_power_consumption.zip")
download.file(url,f)
all_data <- read.csv(unz("household_power_consumption.zip","household_power_consumption.txt"),header=T,
                     sep=";", stringsAsFactors=F, na.strings="?",colClasses=c("character", "character", "numeric",
                                                                              "numeric", "numeric", "numeric",
                                                                              "numeric", "numeric", "numeric"))
## Narrow Data Time Period
all_data$Date <- as.Date(all_data$Date,format="%d/%m/%Y")
my_data <- subset(all_data,Date>=as.Date("01/02/2007", format="%d/%m/%Y") & Date<=as.Date("02/02/2007", format="%d/%m/%Y"))
my_data$date_time <- strptime(paste(my_data$Date, my_data$Time),format="%Y-%m-%d %H:%M:%S")

## Create Plot
png(filename="plot3.png", width=480, height=480)
plot(my_data$date_time, my_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(my_data$date_time, my_data$Sub_metering_2, col="red")
lines(my_data$date_time, my_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(1,1,1))
dev.off()