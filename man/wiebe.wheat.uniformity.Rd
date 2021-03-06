\name{wiebe.wheat.uniformity}
\alias{wiebe.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat
}
\description{
  Uniformity trial of wheat at Aberdeen, Idaho, 1927.
}

\format{
  A data frame with 1500 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column (series)}
    \item{\code{yield}}{yield in grams per plot}
  }
}

\details{
  Yield trial conducted in 1927 near Aberdeen, Idaho.  The crop was
  Federation wheat (C.I. no 4734). Plots were seeded
  on April 18 with a drill that sowed eight rows at a time.
  Individual rows were harvested in August and threshed with a small
  nursery thresher.
  Some authors recommend analyzing the square root of the yields.

  Rows were 15 feet long, 1 foot apart.

  Field width: 12 cols * 15 feet = 180 feet wide.

  Field length: 125 rows * 12 in = 125 feet
  
}

\source{
  Wiebe, G.A. 1935.
  Variation and Correlation in Grain Yield among 1,500 Wheat
  Nursery Plots.
  Journal of Agricultural Research, 50, 331-357.
  http://naldc.nal.usda.gov/download/IND43968632/PDF
}

\references{
  D.A. Preece, 1981,
  Distributions of final digits in data,
  \emph{The Statistician}, 30, 31--60.
  http://doi.org/10.2307/2987702

  Wilkinson et al. (1983).
  Nearest Neighbour (NN) Analysis of Field Experiments.
  \emph{J. R. Statist. Soc. B}, 45, 151-211.
}

\examples{
\dontrun{

library(agridat)
data(wiebe.wheat.uniformity)
dat <- wiebe.wheat.uniformity

libs(desplot)
desplot(yield~col+row, dat,
        aspect=125/180, flip=TRUE, # true aspect
        main="wiebe.wheat.uniformity: yield") # row 1 is at south


# Preece (1981) found the last digits have an interesting distribution
# with 0 and 5 much more common than other digits.
dig <- substring(dat$yield, nchar(dat$yield))
dig <- as.numeric(dig)
hist(dig, breaks=0:10-.5, xlab="Last digit",
     main="wiebe.wheat.uniformity - histogram of last digit")
table(dat$col, dig) # Table 3 of Preece

# Loess
# m3 <- loess(yield~row+col, dat)
# plot(dat$row, resid(m3), ylim=c(-300,300),
#      main="wiebe.wheat.uniformity")

# Wilkinson (1983, p. 152) noted that an 8-row planter was used which
# produced a recurring pattern of row effects on yield.  This can be seen
# in the high autocorrelations of row means at lag 8 and lag 16
rowm <- tapply(dat$yield, dat$row, mean)
acf(rowm, main="wiebe.wheat.uniformity row means")
# Plot the row mean against the planter row unit 1-8
libs("lattice")
xyplot(rowm~rep(1:8, length=125),
       main="wiebe.wheat.uniformity",
       xlab="Planter row unit", ylab="Row mean yield")

}
}
\keyword{datasets}
