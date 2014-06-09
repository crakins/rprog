complete <- function(directory, id = 1:332) {

  data_nobs <- data.frame(id = integer(), nobs = numeric())
  
  for(i in 1:length(id)) {
    # get id in correct format
    if(id[i] < 10) { iid <- paste("00", id[i], sep = "") }
    else if(id[i] > 9 && id[i] < 100) { iid <- paste("0", id[i], sep = "") }
    else { iid <- id[i] }
    
    # geta data file
    filepath <- file.path(directory, paste(iid, ".csv", sep = ""))
    data <- read.csv(filepath)
    
    # clean data (remove rows with an NA value)
    data_clean <- na.omit(data)
    
    # add id and nobs to dataframe
    data_nobs <- rbind(data_nobs, data.frame(id=id[i], nobs=nrow(data_clean)))
  }
  data_nobs
}