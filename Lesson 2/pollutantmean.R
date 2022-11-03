#build a function for question 1
# step by step
file_list <- list.files("specdata", full.names = TRUE) #Create list of files
all_dat <- data.frame()
id <- 1:10
for (i in id){ # remember the sep_along
  #loop through the list and rebind them together
  all_dat <- rbind(all_dat, read.csv(file_list[i]))
  #rbind all_data inside the loop not outside
}
mean(all_dat$sulfate, na.rm = TRUE)

#Functions
pollutantmean <- function(directory, pollutant, id = 1:332){
  file_list <- list.files(directory, full.names = TRUE) #Create list of files
  # important to get the full name including directory location for further reference
  all_dat <- data.frame() #create empty data frame
  for (i in id){ # id defined from argument
    #loop through the list and rebind them together
    all_dat <- rbind(all_dat, read.csv(file_list[i]))
    #rbind all_data inside the loop not outside
  }
mean(all_dat[, pollutant], na.rm = TRUE)
  #important to subset the weight using median
  #important to remove the NA value!!!
  #case sensitive!!! 
}
