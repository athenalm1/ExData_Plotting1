#This script creates plot 4 in the Exploratory Data Analysis project

#Set working directory
setwd("C:/Users/Athena Marquez/Desktop/R_Projects/Course_4")

#Download project data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")
setwd("C:/Users/Athena Marquez/Desktop/R_Projects/Course_4")

#Read and view full dataset file
dataset <- read.table("C:/Users/Athena Marquez/Desktop/R_Projects/Course_4/household_power_consumption.txt", header = TRUE, sep = ";")
View(dataset)

#Subset and view data for selected date range
february <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
View(february)

#Open a png file
png("plot4.png")

#Format plots
par(mfrow = c(2, 2))

#Create plot for global active power
datetime<-as.POSIXct(paste(february$Date, february$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(february$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Create plot for voltage
plot(datetime, as.numeric(february$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

#Create plot for energy sub metering
plot(datetime, as.numeric(february$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(february$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(february$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Create plot for global reactive power
plot(datetime, as.numeric(february$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close png file
dev.off()