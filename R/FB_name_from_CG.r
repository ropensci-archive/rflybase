#' Returns the gene name when the CG number is provided, only 
#' one CG number can be given at a time
#' 
#' @export
#' @param conn postgresql connection object, from a call to 
#' \code{\link{fb_connect}}
#' @param cg (character) CG number 
#' @return single character string of the gene name
#' @examples \dontrun{
#' conn <- fb_connect()
#' fb_name_from_cg(conn, cg = "CG43860")
#' }
fb_name_from_cg <- function(conn, cg) {
  query <- paste0(
    "SELECT DISTINCT (f.name) 
        FROM feature f, feature_dbxref fdbx, dbxref dbx, db 
        WHERE f.feature_id = fdbx.feature_id and fdbx.is_current = 't'
          and fdbx.dbxref_id = dbx.dbxref_id and dbx.db_id = db.db_id 
          and db.name = 'FlyBase Annotation IDs'
          and f.is_obsolete = 'f' 
          and f.type_id = '219'
          and dbx.accession = '", cg,"';")
  res <- RPostgreSQL::dbGetQuery(conn, query)
  
  if (NROW(res) > 1) message(cg)
  if (NROW(res) == 0) res <- cg
  
  as.character(res)
}
