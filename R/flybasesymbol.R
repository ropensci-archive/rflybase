# flybasesymbol.R

flybasesymbol <- 
# Args:
#   symbol: flybase symbol (character)
# Output: xml
# Examples:
#   flybasesymbol("dro5-PA")

function(symbol = NA,
  url = 'http://flybase.org/chadoxml/symbol/',
  ..., 
  curl = getCurlHandle() ) 
{
  url2 <- paste(url, symbol, sep='')
  cat(url2)
  tt <- getURL(url2, curl = curl)
  xmlParse(tt)
}

# http://flybase.org/chadoxml/symbol/dro5-PA