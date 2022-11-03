
#Functions
corr <- function(directory, threshold = 0){
  corf <- numeric()
  completed_nubs <- numeric()
  file_list <- list.files(directory, full.names = TRUE) #Create list of files
  # important to get the full name including directory location for further reference
  for (i in 1:332){ # id defined from argument
    #loop through the list and rebind them together
    dat <- read.csv(file_list[i])
    dat_cleaned <- dat[complete.cases(dat),]
    completed_nubs <- c(completed_nubs, length(dat_cleaned$ID))
    corf <- c(corf, cor(dat_cleaned$nitrate, dat_cleaned$sulfate))
  }
  all_corr <- data.frame(completed_nubs, corf)
  threded <- all_corr[which(all_corr$completed_nubs >= threshold), ]
  threded$corf
}

corr("specdata", 150)