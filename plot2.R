setwd("/Users/jsun3/Box/Study/Coursera/DataScienceSpecialization/04_Exploratory_Data_Analysis/quiz&assignments/assignment1/ExData_Plotting1")

start <- as.POSIXlt("2006-12-16 17:24:00")
time1 <- as.POSIXlt("2007-02-01 00:00:00")
time2 <- as.POSIXlt("2007-02-03 00:00:00")

skip <- as.integer((time1 - start)*24*60)
nrows <- as.integer((time2 - time1)*24*60)

# Read data #
temp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
col_names <- colnames(temp)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = col_names, na.strings = "?", nrows = nrows, skip = skip)

# Clean data #
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Draw plot2 #
png(file = "plot2.png")
par(mfrow = c(1,1))
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()