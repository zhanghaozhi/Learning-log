#download the data package
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

#get to right directory
getwd()
setwd()

#Check what inside the file
list.files("diet_data")

andy <- read.csv("diet_data/Andy.csv")
head(andy)
summary(andy)
dim(andy)
str(andy)

#subseting to see the details
andy_start <- andy[1, 3] 
andy_end <- andy[length(andy$Day), 3]
andy_loss <- andy_start - andy_end

#work with difference files in the list
files <- list.files("diet_data", full.names = TRUE) #full.name argument is important to get the right directory
files

files[1:5]

head(read.csv(files[3]))

#combine two different files together
andy_david <- rbind(andy, read.csv(files[2]))
head(andy_david)
tail(andy_david)

#Subset
day_25 <- andy_david[which(andy_david$Day == 25),]

#Using loops to bind more files
dat <- data.frame() #add this line into the loop will cause it being rewritten with each pass of the loop
for (i in 1:5){
  dat <- rbind(dat, read.csv(files[i]))
}

#calculation and analysis
summary(dat)
median(dat$Weight)

median(dat$Weight, na.rm=TRUE)

day_30 <- dat[which(dat$Day ==30), ]
median(day_30$Weight)


#build a function for it
weightmedian <- function(directory, day){
  lists_of_file <- list.files(directory, full.names = TRUE) #Create list of files
  # important to get the full name including directory location for further reference
  all_dat <- data.frame() #create empty data frame
  for (i in 1:length(lists_of_file)){ # remember the vector start from 1:length
    #loop through the list and rebind them together
    all_dat <- rbind(all_dat, read.csv(lists_of_file[i]))
    #rbind all_data inside the loop not outside
  }
  days_dat <- all_dat[which(all_dat$Day == day),]
  median(days_dat$Weight, na.rm = TRUE)
  #important to subset the weight using median
  #important to remove the NA value!!!
  #case sensitive!!!
}



