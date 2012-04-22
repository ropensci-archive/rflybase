#' Returns XML document of Flybase data.
#' 
#' @import RCurl XML
#' @param symbol flybase symbol (character)
#' @param url the Flybase base API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass
#' the returned value in here (avoids unnecessary footprint)
#' @export
#' @examples \dontrun{  
#' flybasesymbol("dro5-PA")
#' }
flybasesymbol <- function(symbol = NA, url = 'http://flybase.org/chadoxml/symbol/',
  ..., curl = getCurlHandle() ) 
{
  url2 <- paste(url, symbol, sep='')
  message(url2)
  tt <- getURL(url2, curl = curl)
  xmlParse(tt)
}
# http://flybase.org/chadoxml/symbol/dro5-PA