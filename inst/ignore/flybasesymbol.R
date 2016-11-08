#' Returns XML document of Flybase data.
#' 
#' @export
#' @param symbol (character) flybase symbol 
#' @param ... curl options passed on to \code{\link[httr]{GET}}
#' @return an object of class XML
#' @examples \dontrun{  
#' fb_symbol(symbol = "dro5-PA")
#' }
fb_symbol <- function(symbol = NA, ...) {
  url <- 'http://flybase.org/chadoxml/symbol/'
  url2 <- paste(url, symbol, sep = '')
  message(url2)
  tt <- httr::GET(url2, ...)
  res <- httr::content(tt, "text", encoding = "UTF-8")
  xml2::read_xml(res)
}
# http://flybase.org/chadoxml/symbol/dro5-PA
