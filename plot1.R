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

## Create Plot
png(filename="plot1.png", width=480, height=480)
hist(my_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()