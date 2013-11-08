\name{wiebe.wheat.uniformity}
\alias{wiebe.wheat.uniformity}
\docType{data}
\title{
Uniformity trial of wheat
}
\description{
A uniformity trial of 1500 plots of wheat conducted in Idaho in 1927.
}

\format{
  A data frame with 1500 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{col}}{Column (series)}
    \item{\code{yield}}{Yield in grams per plot}
  }
}

\details{
  Yield trial conducted in 1927 near Aberdeen, Idaho.  The crop was
  Federation wheat (C.I. no 4734). Plots were seeded
  on April 18 with a drill that sowed eight rows at a time.
  Individual rows were harvested in August and threshed with a small
  nursery thresher.

  Rows were 15 feet long, 1 foot apart.

  Some authors recommend analyzing the square root of the yields.

  Produced by the U.S. Dept of Agriculture.
}

\source{
  Wiebe, G.A. 1935. Variation and Correlation in Grain Yield among 1,500 Wheat
  Nursery Plots, \emph{Journal of Agricultural Research}, 50, 331-357.
  \url{http://naldc.nal.usda.gov/download/IND43968632/PDF}
}

\references{
  D.A. Preece, 1981, Distributions of final digits in data,
  \emph{The Statistician}, 30, 31--60.
}

\examples{
dat <- wiebe.wheat.uniformity

require("lattice")
# 125 rows = 125 feet tall. 12 cols * 15 feet = 180 feet wide.
desplot(yield~col+row, dat, aspect=125/180, flip=TRUE,
  main="wiebe.wheat.uniformity: yield") # row 1 is at south

# Preece (1981) found the last digits have an interesting distribution.
dig <- substring(dat$yield, nchar(dat$yield))
dig <- as.numeric(dig)
hist(dig, breaks=0:10-.5, main="Histogram of last digit")
table(dat$col, dig) # Table 3 of Preece

# Median yields of rows/cols show obvious trends
plot(tapply(dat$yield, dat$row, median), xlab="Row", ylab="Yield")
plot(tapply(dat$yield, dat$col, median), xlab="Column", ylab="Yield")
# Spatial trends are obvious
xyplot(yield~col, dat, type=c('p','smooth'))

# Loess
m3 <- loess(yield~row+col, dat)
plot(fitted(m3), resid(m3), ylim=c(-300,300))
}
\keyword{datasets}