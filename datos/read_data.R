library(data.table)
library(lubridate)
setwd("~/MEGA/MEGAsync/DATA-SCIENCE/work/c4-w1-project/datos")

if (!file.exists('power_consumption_clean.txt'))   {
    # download the zip file and unzip
    file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(file.url,destfile='power_consumption.zip')
    unzip('power_consumption.zip',overwrite=TRUE)
    columns<-c(rep('character',2),rep('numeric',7))
    power.consumption<-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=columns)
    power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
    power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
    pow_consumption<-power.consumption[,c(10,3:9)]
    write.table(pow_consumption,file='power_consumption_clean.txt',sep='|',row.names=FALSE)
    file.remove('household_power_consumption.txt')
    file.remove('power_consumption.zip')
} else {
  pow_consumption<-read.table('power_consumption_clean.txt',header=TRUE,sep='|')
  pow_consumption$DateTime<-as.POSIXlt(pow_consumption$DateTime)
}
