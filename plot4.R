plot4 <- function(data) {
    
    household_table <- read.table(data, header = TRUE, sep = ";", na.strings = "?")
    # store data table in variable
    household_table <- subset(household_table, Date == "1/2/2007" | Date == "2/2/2007")
    # get the subset of the data needed
    household_table$DateTime <- strptime(paste(household_table$Date, household_table$Time), format="%d/%m/%Y %H:%M:%S")
    # convert the date and times into a new format
    par(mfrow = c(2, 2))
    # set the layout of the graph
    with(household_table, {
        plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
        plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
        plot(DateTime, Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
    })
    # get all the data using "with"
    dev.copy(png, file = "plot4.png", height = 480, width = 480)
    # copy the graphics to a png file with the appropriate height and width
    dev.off()
}