translate_to_svampeatlas <- function(namesN,startpoint=1){
 require(httr)
 require(jsonlite)
 require(lubridate)
 new_name <- vector()
 taxonid <- vector()
 processedX <- vector()
 url  <- "https://svampe.databasen.org/"
 for (name in startpoint:length(namesN)){
  print(paste0(name," : ",namesN[name]))
  searchpattern <- gsub(" ","+",namesN[name])
  path <- paste0("api/taxa?_order=[[%22FullName%22]]&include=[{%22model%22:%22TaxonRedListData%22,%22as%22:%22redlistdata%22,%22required%22:false,%22attributes%22:[%22status%22],%22where%22:%22{\\%22year\\%22:2009}%22},{%22model%22:%22Taxon%22,%22as%22:%22acceptedTaxon%22},{%22model%22:%22TaxonAttributes%22,%22as%22:%22attributes%22,%22attributes%22:[%22PresentInDK%22]},{%22model%22:%22TaxonDKnames%22,%22as%22:%22Vernacularname_DK%22,%22required%22:false},{%22model%22:%22TaxonStatistics%22,%22as%22:%22Statistics%22,%22required%22:false},{%22model%22:%22TaxonImages%22,%22as%22:%22Images%22,%22required%22:false}]&limit=100&offset=0&where={%22FullName%22:%22",searchpattern,"%22}")
  raw.result <- GET(url = url, path = path)
  this.raw.content <- rawToChar(raw.result$content)
  this.content <- fromJSON(this.raw.content)
  processedX[name] <- "converted"
  if(length(this.content) > 0){
   if (namesN[name] %in% this.content$acceptedTaxon$FullName){indexX = which(this.content$acceptedTaxon$FullName == namesN[name])[1]} else {indexX <- 1}
   new_name[name] <- this.content$acceptedTaxon$FullName[indexX]
   taxonid[name] <- this.content$acceptedTaxon$`_id`[indexX]
   if(new_name[name] == namesN[name]){
    print("same name")
    processedX[name] <- "unchanged"
   } else{
    print(paste0("translated to: ",new_name[name]))
   }
  } else {
   new_name[name] <- namesN[name]
   taxonid[name] <- NA
   processedX[name] <- "no_match"
   print(paste0("no match"))
  }
 }
 result <- data.frame(old_name=namesN, new_name=new_name, taxonid=taxonid,action=processedX)
 return(result)
}