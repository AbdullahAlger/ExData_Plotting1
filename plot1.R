plot1 <- function(data) {
    
    household_table <- read.table(data, header = TRUE, sep = ";", na.strings = "?")
    # store data table in variable
    household_table <- subset(household_table, Date == "1/2/2007" | Date == "2/2/2007")
    # get the subset of the data needed
    household_table$DateTime <- strptime(paste(household_table$Date, household_table$Time), format="%d/%m/%Y %H:%M:%S")
    # convert the date and times into a new format
    hist(household_table[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
    # create a histogram
    dev.copy(png, file = "plot1.png", height = 480, width = 480)
    # copy the graphics to a png file with the appropriate height and width
    dev.off()
}