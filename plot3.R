# Plot 3: Sub_metering_1,2,3
# 1. Read the data
# 2. Construct the plot
# 3. Create the PNG file
# 4. save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# 5. Name the plot file as plot3.png

# Read the data
orgData <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors = FALSE, na.strings = "?")

# Filter the data from 2007-02-01 and 2007-02-02
data <- orgData[orgData$Date=="1/2/2007" | orgData$Date=="2/2/2007",]

# Convert Date to Date class and Time to Time class
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- as.POSIXct(strftime(paste(data$Date,' ',data$Time),format = "%Y-%m-%d %H:%M:%S"))

# Remove the Original Data as it's no longer needed
rm(orgData)

# Create the PNG file
# Open PNG device; create "plot3.png" in the working directory
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Construct the plot for sub_metering_1
plot(data$Time,data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type="l")
# Add sub_metering_2 data to existing plot
lines(data$Time,data$Sub_metering_2,col="red")
# Add sub_metering_3 data to existing plot
lines(data$Time,data$Sub_metering_3,col="blue")

# Add legends to plot
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = c(2.5,2.5,2.5))

# Close the PNG device
dev.off()