#Load Dataset
DT <- data.table::fread("household_power_consumption.txt", header = TRUE, na.strings = "?")

#Convert Date string to Date
DT$Date <- dmy(DT$Date)

#Subset Dataset from Date specified
DT <- DT[DT$Date >= "2007-02-01" & DT$Date <= "2007-02-02", ]

#Make DateTime column
DT$DateTime <- paste(DT$Date, DT$Time)
DT$DateTime <- ymd_hms(DT$DateTime)

#Generate Plot 2
plot(DT$DateTime, DT$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="") 

#Save PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
