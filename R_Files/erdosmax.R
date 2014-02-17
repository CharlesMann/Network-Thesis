erdosmax <- function(file, pattern){
  erdos   <- readLines(file)
  # matches <- length(erdos[grepl(pattern, erdos, ignore.case = TRUE)])
  pattern <- "[0-9]{4,4}"
  Mainpeeps <- grep(pattern, erdos, value = TRUE)
  mainindices <- grep(pattern, erdos)
  
  ## For each main peep, get their index, then the index of the peep after,
  ## and for all of the elements in between, put them in a list.
 # testdata <- array(data = NA, dim = c(511, 2, 30))
 ind_values <- array(data = NA, dim = 510)
  for(i in 1:length(Mainpeeps)){
    indices <- as.numeric(mainindices[i+1] - mainindices[i])
    ind_values[i] <- indices
    #coauthors <- erdos[(mainindices[(i)]+1):(mainindices[(i+1)]-2)] ## The ones will be i's
    #testdata[1,1,1:length(coauthors)] <- coauthors
  }
 maximum <- max(ind_values, na.rm = TRUE)
 return(maximum)
}
 
  