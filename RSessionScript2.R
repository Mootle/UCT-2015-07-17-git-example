setwd("C:/Users/01425453/Desktop/programming-with-R/r-novice-inflammation")

dat <- read.csv(file = "data/inflammation-01.csv", header = FALSE)

weight_kg <-55


avg_patient_inflammation <- apply(dat,1, mean)
avg_day_inflammation <- apply(dat,2, mean) # columns are days


myplotMax <- apply(dat, 2, max) # plotting max daily inflammation
plot(myplotMax)
myplotStd <- apply(dat, 2, sd) # standard deviation of each day
plot(myplotStd)


####module 2
#defining functions

farh_to_kelvin <- function(temp){
  kelvin <- ((temp -32)*(5/9)) +273.15
  return(kelvin)
}

farh_to_C <- function(temp){
  Celcius <- ((temp -32)*(5/9))
  return(Celcius)
}

#challenge

original <- c("this",'is','your','challenge')
wrapper <- "!!!!YAY!!!"
fence <- function(original,wrapper){
  return(c(wrapper,original,wrapper))
}
fence2 <- function(original,wrapper){
  temp <- ""
  for (i in 1:length(original)){
    temp <- paste(temp,original[i],sep = " ")
  }
  temp2 <- paste(wrapper,temp,sep =" ")
  temp3 <- paste(temp2,wrapper,sep = " ")
  return(temp3)
  
}
fence3 <- function(original,wrapper){
  
  temp1 <- paste(original,collapse = " ",sep =" ")
  temp2 <- paste(wrapper,temp1,collapse = " ",sep = " ")
  temp3 <- paste(temp2,wrapper,collapse = " ",sep = " ")
  return(temp3)
  
}
mysol <- fence(original,wrapper)
mysol2 <- fence2(original,wrapper)
mysol3 <- fence3(original,wrapper)

centre <- function(data,desired){
  newdata <- (data -mean(data)) + desired
  return(newdata)
  
}

z <- c(0,0,0,0)
centre(z,0)
centred <- centre(dat[,4],0)
head(centred)

analyse <- function(filename){
  data <- read.csv(file = filename, header = FALSE)
  
  avgdat <- apply(data,2,mean)# average of days
  maxdat <- apply(data,2,max) #maximum
  stdat <- apply(data,2,sd) # standard deviation
  
  par(mfrow = c(1,3))
  
  plot(avgdat)
  plot(maxdat)
  plot(stdat)
  par(mfrow =c(1,1))
}
pdf()
plot()
dev.off()

analyse("data/inflammation-01.csv")

mylistvec <-list.files("data",pattern = "mmation", full.names = T)

for (i in 1:length(mylistvec)){
  filename <- mylistvec[i]
  print(filename)
  analyse(filename)
}