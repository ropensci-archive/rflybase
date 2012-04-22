\name{flybasesymbol}
\alias{flybasesymbol}
\title{Returns XML document of Flybase data.}
\usage{
  flybasesymbol(symbol = NA,
    url = "http://flybase.org/chadoxml/symbol/", ...,
    curl = getCurlHandle())
}
\arguments{
  \item{symbol}{flybase symbol (character)}

  \item{url}{the Flybase base API url for the function
  (should be left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\description{
  Returns XML document of Flybase data.
}
\examples{
\dontrun{
flybasesymbol("dro5-PA")
}
}

