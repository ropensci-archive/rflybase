#Make a connection with the read only postgreSQL version of the flybase database.
#For intense use, one should downlaod the database and change this function. 

# needs require("RPostgreSQL")


FB_connect<- function () {
  if (!exists("con") ){
    drv <<- dbDriver("PostgreSQL")
    con <<- dbConnect(drv, dbname = "flybase",
                      host = "flybase.org", port = 5432,
                      user = "flybase", password = "flybase")
  }
  if (!dbExistsTable(con, "feature") ){
    drv <<- dbDriver("PostgreSQL")
    con <<- dbConnect(drv, dbname = "flybase",
                      host = "flybase.org", port = 5432,
                      user = "flybase", password = "flybase")
  }
}  

