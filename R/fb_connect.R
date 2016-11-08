#' Returns the connection to the database
#'  
#' @export
#' @param dbname (character) database name. default: flybase
#' @param host (character) database name. default: flybase.org
#' @param port (integer) database name. default: 5432
#' @param user (character) database name. default: flybase
#' @param password (character) database name. default: flybase
#' @param dplyr (logical) if \code{TRUE}, returns class \code{src_postgres}; 
#' otherwise, an object of class \code{PostgreSQLConnection}. 
#' Default: \code{FALSE}
#' @param ... further args passed on to \code{\link[DBI]{dbConnect}}
#' @details Make a connection with the read only postgreSQL version of 
#' the flybase database. For intense use, one should downlaod the database 
#' and change this function.
#' @examples \dontrun{
#' (conn <- fb_connect())
#' 
#' # using with dplyr
#' library("dplyr")
#' (src <- fb_connect(dplyr = TRUE))
#' orgs <- src %>% tbl("organism")
#' orgs %>% filter(genus == "Antheraea")
#' 
#' tbl(src, sql('SELECT * FROM phenotype WHERE "phenotype_id" = 8511'))
#' }
fb_connect <- function(dbname = "flybase", host = "flybase.org", 
                       port = 5432, user = "flybase", password = "flybase", 
                       dplyr = FALSE, ...) {
  drv <- DBI::dbDriver("PostgreSQL")
  if (dplyr) {
    if (!requireNamespace("dplyr")) {
      stop("install 'dplyr'", call. = FALSE)
    }
    dplyr::src_postgres(dbname = "flybase",
                        host = "flybase.org", port = 5432,
                        user = "flybase", password = "flybase", ...)
  } else {
    DBI::dbConnect(drv, dbname = "flybase",
                   host = "flybase.org", port = 5432,
                   user = "flybase", password = "flybase", ...) 
  }
}  
