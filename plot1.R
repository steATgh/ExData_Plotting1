plot1 <- function() {

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
  
  
  #plot 1
  #   Histogram over global active power  
  x <- data_local[["Glob_ac_pwr"]]
  y<-as.numeric(levels(x)[x])
  png(file = "plot1.png")
  with(faithful, hist(y, main = "Global Active Power" , col="red", xlab="Global Active Power (kilowatts)"))
  dev.off()
}