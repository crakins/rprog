corr <- function(directory, threshold = 0) {
  
  # get number of data files
  numfiles <- length(list.files(directory))
  
  # empty vector
  corrData <- vector()
  
  for(i in 1:numfiles) {
    
    # get id in correct format
    if(i < 10) { iid <- paste("00", i, sep = "") }
    else if(i > 9 && i < 100) { iid <- paste("0", i, sep = "") }
    else { iid <- i }
    
    # geta data file
    filepath <- file.path(directory, paste(iid, ".csv", sep = ""))
    data <- read.csv(filepath)
    
    # clean data (remove rows with an NA value)
    data_clean <- na.omit(data)
    
    # count number of completely observied cases
    noRows <- nrow(data_clean)
    
    # if greather than threshold ad to 
    
    if(noRows > threshold) {

      # calculate corr between sulfate and nitrate and return as vector
      corrFileData <- cor(data_clean$sulfate, data_clean$nitrate)
    }
    else { corrFileData <- vector() }
    corrData <- c(corrData, corrFileData)
  }
  corrData
}