plot2 <- function() {
  
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
  
  #plot 2
  # global active power over date and time 
  x <- data_local[["Glob_ac_pwr"]]
  x <- as.numeric(levels(x)[x])
  time_data<-as.POSIXct(paste(data_local[["Date"]], data_local[["Time"]]), format="%d/%m/%Y %H:%M")
  
  png(file = "plot2.png")
  
  plot(time_data,x, main = "Global Active Power" , type="l",col="black", ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
  
}