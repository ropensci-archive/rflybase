rflybase
=======

## UPDATE as of 2016-10.15

This package has been rebooted. Access to the flybase Chado database (read only public copy) is done using RPostgreSQL. Functions are based on SQRL queries.

## Info

FlyBase  provides public read only access to our Chado database. It is not supposed to get intensive traffic. Please read the flybase instruction to downlaod the database for intense use.
ftp://ftp.flybase.net/releases/FB2016_04/psql/README


Example of queries: http://gmod.org/wiki/FlyBase_Field_Mapping_Tables

## Install


```r
devtools::install_github("ropensci/rflybase")
```


```r
library("rflybase")
```

## setup connection to flybase database


```r
conn <- fb_connect()
```

## query


```r
library("dplyr")
src <- fb_connect(dplyr = TRUE)
orgs <- src %>% tbl("organism")
orgs %>% filter(genus == "Antheraea")
```

```
## # Source:   lazy query [?? x 6]
## # Database: postgres 9.5.7 [flybase@chado.flybase.org:5432/flybase]
##    organism_id abbreviation     genus       species common_name comment
##          <int>        <chr>     <chr>         <chr>       <chr>   <chr>
##  1           8         <NA> Antheraea          jana        <NA>    <NA>
##  2           9         <NA> Antheraea       godmani        <NA>    <NA>
##  3          10         <NA> Antheraea       helferi        <NA>    <NA>
##  4          11         <NA> Antheraea kelimutuensis        <NA>    <NA>
##  5          12         <NA> Antheraea       larissa        <NA>    <NA>
##  6          13         <NA> Antheraea        lampei        <NA>    <NA>
##  7          14         <NA> Antheraea paukstadtorum        <NA>    <NA>
##  8          15         <NA> Antheraea      raffrayi        <NA>    <NA>
##  9          16         <NA> Antheraea    rosemariae        <NA>    <NA>
## 10          17         <NA> Antheraea        roylii        <NA>    <NA>
## # ... with more rows
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rflybase/issues).
* License: MIT
* Get citation information for `rflybase` in R doing `citation(package = 'rflybase')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
