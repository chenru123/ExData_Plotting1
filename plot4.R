# Plot 4: 4 different plots in 2x2 view
# 1. Read the data
# 2. Construct the plot
# 3. Create the PNG file
# 4. save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# 5. Name the plot file as plot4.png

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
# Open PNG device; create "plot4.png" in the working directory
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Construct the plot
# Define the subsequent figures to draw
par(mfrow=c(2,2))
# Top-left plot
plot(data$Time,data$Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")

# Top-right plot
plot(data$Time,data$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")

# Bottom-left plot
plot(data$Time,data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type="l")
# Add sub_metering_2 data to existing plot
lines(data$Time,data$Sub_metering_2,col="red")
# Add sub_metering_3 data to existing plot
lines(data$Time,data$Sub_metering_3,col="blue")

# Add legends to plot
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), 
       lwd = c(2.5,2.5,2.5),bty = "n")

# Bottom-right plot
plot(data$Time,data$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")

# Close the PNG device
dev.off()

