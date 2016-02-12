# Plot 2: Global Active Power
# 1. Read the data
# 2. Construct the plot
# 3. Create the PNG file
# 4. save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# 5. Name the plot file as plot2.png

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
# Open PNG device; create "plot2.png" in the working directory
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Construct the plot
plot(data$Time,data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")

# Close the PNG device
dev.off()