pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    pdata_all = vector()
  
    for(i in 1:length(id)) {
      # get id in correct format
      if(id[i] < 10) { iid <- paste("00", id[i], sep = "") }
      else if(id[i] > 9 && id[i] < 100) { iid <- paste("0", id[i], sep = "") }
      else { iid <- id[i] }
      # save data from file into dataframe
      filepath <- file.path(directory, paste(iid, ".csv", sep = ""))
      data <- read.csv(filepath)
      pdata <- data[pollutant]
      bad <- is.na(pdata)
      pdata_clean <- pdata[!bad]
      pdata_all <- c(pdata_all, pdata_clean)
    } 
    mean(pdata_all)
}