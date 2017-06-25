#' Returns the flybase stock name when the flybase genotype name (with @ entries) is provided, only 
#' one name can be given at a time
#' 

#' @export
#' @param genotype_name (character) flybase stock genotype name out of genotype table 
#' @param output (character) choose type of return, "text" for a text version, "table" for a table with each allele as a row, "html" (to do) for a html version of the name with links to flybase
#' @return depending on output
#' @examples \dontrun{
#' 
#' fb_clean_stock_name( genotype_name = "w<up>*</up>; @FBal0000021:βTub60D<up>2</up>@ w<up>*</up> @FBal0005583:Kr<up>If-1</up>@/@FBba0000025:CyO@")
#' }
fb_clean_stock_name <- function(genotype_name, output = "text") {
  # separate string by pattern @
  stringr::str_split (genotype_name, c("@"))[[1]]->y
  # created output dataframe
  G=data.frame (NA,NA, NA)
  # This loop deal with entries not starting with @: then y do not start with an empty element and there is no affiliated allele (no link)
  if (y[1] != ""){
    G=rbind (G, c (NA,"",y[1]))
  }
  y= y[-1]
  # add other alleles, if exists:
  if (length(y) !=0) {
    
    n= c(0:(length(y)/2-1))*2+1
    for (i in n) {
      temp= str_split(y[i], ":")[[1]]
      G=rbind ( G, c(temp[1],temp[2],y[i+1]) )
    }
  }
  G= G[-1,]
  names(G) =c ("link","allele", "extra")
  
  if (output == "html") {
    G = G %>% mutate (temp= paste0 ('<a href="https://www.flybase.org/reports/',link,'.html">',allele,"</a>"))
    res = G %>% transmute (temp2= paste0(temp,extra) )
   # problem is here:
    res = res[,1]
    res = str_replace_all(res, "<up>", "<sup>" )
    res = str_replace_all(res, "</up>", "</sup>" )  
    res = paste(res,collapse="")
   }else if (output == "text"){
    res = G %>% transmute (temp= paste0(allele,extra) ) 
    res = res[,1]
    res = str_replace_all(res, "<up>", "[" )
    res = str_replace_all(res, "</up>", "]" )
    res = paste(res,collapse="")
  }else if (output == "table"){
    res=G
  }  
  res
}
