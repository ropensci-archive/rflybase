#Returns the gene name when the CG number is provided,
#only one CG number can be given at a time
#depends on FB_connect() and RPostgreSQL

#' @param CGnumb CG number 

FB_namefromCG <- function (CGnumb) {
  FB_connect()
  
  query= paste0("SELECT DISTINCT (f.name) FROM feature f, feature_dbxref fdbx, dbxref dbx, db WHERE f.feature_id = fdbx.feature_id and fdbx.is_current = 't'         and fdbx.dbxref_id = dbx.dbxref_id and dbx.db_id = db.db_id and db.name = 'FlyBase Annotation IDs'            and f.is_obsolete = 'f' and f.type_id = '219'          and dbx.accession = '",
                CGnumb,"';")
  
  h=dbGetQuery(con,query)
  
  if(nrow(h) >1) {message (CGnumb)}
  if(nrow(h) == 0) {h=CGnumb}
  
  as.character(h)
}