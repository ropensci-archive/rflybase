#' @title Interface to Flybase (\url{http://flybase.org/})
#'
#' @description rflybase: A programmatic interface to Flybase.org
#' 
#' @section The database:
#' This package connects to a remote PostgreSQL database, the same that 
#' powers their web interface. 
#' 
#' You can optionally download the entire Flybase database to your own 
#' machine/server, but apparently the expanded and loaded database is 
#' about 100 GB, which likely means most people will want to use the 
#' remote database (the default set up for this package). 
#' 
#' To use the remote database, follow instructions at 
#' ftp://ftp.flybase.net/releases/FB2016_05/psql/README
#'
#' @import RPostgreSQL DBI stringr
#' @name rflybase-package
#' @aliases rflybase
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @author Julien Colomb
NULL
