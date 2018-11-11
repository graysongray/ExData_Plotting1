#Load Dataset
DT <- data.table::fread("household_power_consumption.txt", header = TRUE, na.strings = "?")

#Convert Date string to Date
DT$Date <- dmy(DT$Date)

#Subset Dataset from Date specified
DT <- DT[DT$Date >= "2007-02-01" & DT$Date <= "2007-02-02", ]

#Make DateTime column
DT$DateTime <- paste(DT$Date, DT$Time)
DT$DateTime <- ymd_hms(DT$DateTime)



#Set Parameter 2x2 plot result
par(mfrow=c(2,2))

#Generate Plot 4
with(DT,{
    
    plot(Global_active_power~DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
    plot(Voltage~DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab="datetime" )
    plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime, col="Red")
    lines(Sub_metering_3~DateTime, col="Blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Global_reactive_power~DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab="datetime")
})

#Save PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

