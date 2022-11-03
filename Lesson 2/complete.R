#build a function for question 1
# step by step
file_list <- list.files("specdata", full.names = TRUE) #Create list of files
id <- 30:25
for (i in id){ # remember the sep_along
  #loop through the list and rebind them together
  dat <- read.csv(file_list[i])
}

# subset complete cases
dat_sul <- dat[!is.na(dat$sulfate),]
dat_both1 <- dat_sul[!is.na(dat_sul$nitrate),]

dat_both2 <- dat[!is.na(dat$sulfate) & !is.na(dat$nitrate),]

dat_both3 <- sum(complete.cases(dat))

# define nobs
nobs <- numeric()
id <- 30:25
for (i in id){ # remember the sep_along
  #loop through the list and rebind them together
  dat <- read.csv(file_list[i])
  nobs <- c(nobs, sum(complete.cases(dat)))
}
data.frame(id, nobs)


#Functions
complete <- function(directory, id = 1:332){
  nobs <- numeric()
  file_list <- list.files(directory, full.names = TRUE) #Create list of files
  # important to get the full name including directory location for further reference
  for (i in id){ # id defined from argument
    #loop through the list and rebind them together
    dat <- read.csv(file_list[i])
    #rbind data inside the loop not outside
    nobs <- c(nobs, sum(complete.cases(dat)))
  }
  data.frame(id, nobs)
  #important to subset the weight using median
  #important to remove the NA value!!!
  #case sensitive!!!
}