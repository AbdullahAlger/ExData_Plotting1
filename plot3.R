plot3 <- function(data) {
    
    household_table <- read.table(data, header = TRUE, sep = ";", na.strings = "?")
    # store data table in variable
    household_table <- subset(household_table, Date == "1/2/2007" | Date == "2/2/2007")
    # get the subset of the data needed
    household_table$DateTime <- strptime(paste(household_table$Date, household_table$Time), format="%d/%m/%Y %H:%M:%S")
    # convert the date and times into a new format
    plot(household_table$DateTime, household_table$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
    lines(household_table$DateTime, household_table$Sub_metering_2, col="red")
    lines(household_table$DateTime, household_table$Sub_metering_3, col="blue")
    # create a plot with different color lines for the values
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # create the legend
    dev.copy(png, file = "plot3.png", height = 480, width = 480)
    # copy the graphics to a png file with the appropriate height and width
    dev.off()
}