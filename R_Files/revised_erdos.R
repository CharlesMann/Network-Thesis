revised_erdos <- function(file, pattern){
  erdos       <- readLines(file)
  pattern     <- "[0-9]{4,4}"
  E1list   <- grep(pattern, erdos, value = TRUE)
  # Chop off everything but names of E1list
  indices_of_nums <- vector(mode= "numeric", length = 511)
  newlist <- vector(mode="character", length = 511)
  indicesneeded <- grep("[A-Z](.)[A-Z][A-Z]", erdos)
  new_erdos <- erdos[indicesneeded]
  #for(i in 1:511){
    #splitlist <- strsplit(E1list[[i]], "")[[1]]
    #splitlist <- paste0(splitlist[c(TRUE, FALSE)], splitlist[c(FALSE, TRUE)])
    #tester <- grep("[  ]{2,5}", splitlist)
    #indices_of_nums[i] <- tester[1]-1 
   # newlist[i] <- paste(splitlist[1:indices_of_nums[i]], collapse = "")
  #}
  #for(i in 1:511){
    #splitlist <- strsplit(newlist[[i]], "")[[1]]
    #lengthcompare <- length(splitlist)
    #ismatch <- grep("[ ]", splitlist)
    #if(ismatch[length(ismatch)] == lengthcompare){
     # splitlist <- splitlist[1:(length(splitlist)-1)]
    #  newlist[i] <- paste(splitlist, collapse = "") 
   # }
  #}
  
  
  # matches <- length(erdos[grepl(pattern, erdos, ignore.case = TRUE)])
  
  ##Eliminate those with En>1
  #E1pattern <- sub("*", "\\*", newlist, fixed=TRUE)
  #E1pattern <- sub("^", "\\^", E1pattern, fixed=TRUE)
  #E1pattern <- sub("(", "\\(", E1pattern, fixed = TRUE)
  #E1pattern <- sub(")", "\\)", E1pattern, fixed = TRUE)
  #E1pattern <- paste(E1pattern, collapse = "|")
  #eliminate <- grepl(E1pattern, erdos)
 # new_erdos <- erdos[eliminate]
  ## mainindices finds the indices of each main researcher in newlist
  mainindices <- grep(pattern, new_erdos)
 write.table(new_erdos, file = "\\Users\\charlesmann\\Documents\\Me2")
 
  
  ## For each main peep, get their index, then the index of the peep after,
  ## and for all of the elements in between, put them in a list.
  #testdata <- array(data = NA, dim=c(3314, 2))
  #beginning_index <- 1
  #for(i in 1:(length(newlist))){
  #  if(i==length(newlist)){#special case
      #index <- length(new_erdos)
      #coauthors <- new_erdos[(mainindices[(i)]+1):index]
      #testdata[(beginning_index:((beginning_index+(length(coauthors)))-1)),1] <- rep(newlist[i], length(coauthors))
     # testdata[(beginning_index:((beginning_index+(length(coauthors)))-1)),2] <- coauthors}  
    #else{
      #coauthors <- new_erdos[(mainindices[(i)]+1):(mainindices[(i+1)]-1)] 
      #if(mainindices[i]==(mainindices[i+1]-1)){
        #There are no coauthors for that person
      #  coauthors <- "NA"
      #}
      #testdata[(beginning_index:(beginning_index+length(coauthors)-1)),1] <- rep(newlist[i], length(coauthors))
      #testdata[(beginning_index:(beginning_index+(length(coauthors))-1)),2] <- coauthors
     # beginning_index <- (beginning_index + (length(coauthors)))
   ## }
  #}
  #Trying to get rid of \t
  #for(i in 1:length(testdata[,2])){
    #tobe_edited <- testdata[i,2]
    #edited <- sub("\t", "", tobe_edited)
   # testdata[i,2] <- edited
  #}
  #write.table(testdata, file = "\\Users\\charlesmann\\Documents", sep = "\t", row.names = F, col.names = F)
  
}
