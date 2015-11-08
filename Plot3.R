library(sqldf)
setwd("~/Coursera/ExploratoryDataAnalysis/CourseProject1/exdata-data-household_power_consumption")

#Read from household_power_consumption.txt
fn <- paste(getwd(),"household_power_consumption.txt", sep="/")
ds <- read.csv.sql(fn, sql = "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')", header=TRUE, sep=";")
closeAllConnections()
ds$Time = strptime(paste(ds$Date, ds$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Plot 3
par(mfrow=c(1,1))
plot(ds$Time, ds$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
lines(ds$Time, ds$Sub_metering_1, type = "l")
lines(ds$Time, ds$Sub_metering_2, type = "l", col = "red")
lines(ds$Time, ds$Sub_metering_3, type = "l", col = "blue")
legend("topright", cex =.75, legend=names(ds[7:9]), pch = c(NA,NA,NA), lwd=1, lty=c(1,1,1), col =c("black","red","blue"))
#Print to PNG
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
