#This script creates plot 2 in the Exploratory Data Analysis project

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
png("plot2.png")

#Create plot for global active power
datetime<-as.POSIXct(paste(february$Date, february$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(february$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close png file
dev.off()
