plot3 <- function() {
  
  x<-list()
  data <- data.frame()
  data_local<-data.frame()
  
  # load data
  data <- read.table("data.txt", sep= ";" )
  #filter and clean data
  dates<-data["V1"]
  dates <- as.Date(dates[,1], format="%d/%m/%Y" ) 
  data_local <- data[dates >="2007-02-01" & dates <="2007-02-02", ]
  names(data_local)<-c("Date","Time","Glob_ac_pwr","Glob_re_pwr","V","Glob_int","SM_1","SM_2","SM_3")
  data_local<-data_local[complete.cases(data_local),]

  
  #plot 3
  #  all three sm over data and time
  x1 <- data_local[["SM_1"]]
  x1 <- as.numeric(levels(x1)[x1])
  x2 <- data_local[["SM_2"]]
  x2 <- as.numeric(levels(x2)[x2])
  x3 <- data_local[["SM_3"]]
  x3 <- as.numeric(levels(x3)[x3])
  
  time_data<-as.POSIXct(paste(data_local[["Date"]], data_local[["Time"]]), format="%d/%m/%Y %H:%M")
  
  png(file = "plot3.png")
  
  plot(time_data,x1,ylim=c(0,38) , type="l",col="black", ylab="Energy sub-metering",xlab="")
  lines(time_data,x2, type="l",col="red",ylab="")  
  lines(time_data,x3, type="l",col="blue",ylim=c(0,38),ylab="") 
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

  dev.off()
}