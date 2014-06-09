complete <- function(directory, id = 1:332) {

  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  data_clean <- data.frame()
  
  for(i in 1:length(id)) {
    # get id in correct format
    if(id[i] < 10) { iid <- paste("00", id[i], sep = "") }
    else if(id[i] > 9 && id[i] < 100) { iid <- paste("0", id[i], sep = "") }
    else { iid <- id[i] }
    # save data from file into dataframe
    filepath <- file.path(directory, paste(iid, ".csv", sep = ""))
    data <- read.csv(filepath)
}