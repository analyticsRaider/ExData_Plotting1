library(sqldf)
setwd("~/Coursera/ExploratoryDataAnalysis/CourseProject1/exdata-data-household_power_consumption")

#Read from household_power_consumption.txt
fn <- paste(getwd(),"household_power_consumption.txt", sep="/")
ds <- read.csv.sql(fn, sql = "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')", header=TRUE, sep=";")
closeAllConnections()
ds$Time = strptime(paste(ds$Date, ds$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Plot 2
par(mfrow=c(1,1))
with(ds,
     plot(Time, Global_active_power, type ="l", xlab ="", ylab ="Global Active Power (killowatts)")
)
#Print to PNG
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
