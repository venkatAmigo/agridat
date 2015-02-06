\name{kalamkar.potato.uniformity}
\alias{kalamkar.potato.uniformity}
\docType{data}
\title{
  Uniformity trial of potatoes.
}
\description{
  Uniformity trial of potatoes.
}
\usage{data(kalamkar.potato.uniformity)}
\format{
  A data frame with 576 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row number, 1-96}
    \item{\code{col}}{column number, 1-6}
    \item{\code{yield}}{yield of potatoes per plot}
  }
}
\details{
  The data is for potato yields in 96 rows, each 132 feet long, with 3
  feet between rows.

  Each row was harvested as six plots, each 22 feet long.  Each hill had
  one seed piece.  Hills were spaced 2 feet apart in each row.
}
\source{
  Kalamkar, R.J. (1932).
  Experimental Error and the Field-Plot Technique with Potatoes.
  \emph{The Journal of Agricultural Science}, 22, 373-385.
}

\examples{

data(kalamkar.potato.uniformity)
dat <- kalamkar.potato.uniformity

# True field dimension is 132 foot-long row horizontal, 96*3=288 feet vertical
# Similar to figure 1 of Kalamkar
desplot(yield~col*row, data=dat, main="kalamkar.potato.uniformity",
        flip=TRUE, tick=TRUE, aspect=288/132)

}
\keyword{datasets}