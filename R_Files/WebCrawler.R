WebCrawler <- function(url, numpages, authorcomp){
  
  require(RCurl)
  ## This will have to be a little intense. Enter in an author's name. This pulls a long list of their papers.
  ## "Click" on a paper. "Click" on the number of citations. This displays a google list of all of the papers
  ## that cite this first one. This list could be searched, looking for matches where the author of the citing
  ## paper matches one of the authors in the network we are considering. These matching articles could be in 
  ## the running to be in our article network. This would have to be done for every article for every author. 
  ## This would basically construct a vast article network though. 
  
  orig_webpage <- getURL(url)
  
  paper_list <- list()
  
  for(i in 1:numpages){
    match <- grep(authorcomp, orig_webpage)
    if(match){
      #Record paper
      paper_list[[i]] <- "yes"
    }

  }
  return(0)
  
}