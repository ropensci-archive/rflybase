#' Returns the flybase stock name when the FBID number is provided, only 
#' one FBID number can be given at a time
#' 
#' @export
#' @param conn postgresql connection object, from a call to 
#' \code{\link{fb_connect}}
#' @param fbst (character) flybase stock number 
#' @return single character string of the stock name
#' @examples \dontrun{
#' conn <- fb_connect()
#' fb_get_stockname(conn, fbst = "FBst0000002")
#' }
fb_get_stockname <- function(conn, fbst) {
  query <- paste0(
    "SELECT genotype.name
  FROM stock s, stock_genotype sg, genotype
    WHERE s.uniquename='",fbst,"' AND s.stock_id=sg.stock_id AND
    sg.genotype_id=genotype.genotype_id;")

  res <- RPostgreSQL::dbGetQuery(conn, query)
  
  if (NROW(res) > 1) message(fbst)
  if (NROW(res) == 0) res <- fbst
  
  as.character(res)
}
