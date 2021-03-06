\name{kiesselbach.oats.uniformity}
\alias{kiesselbach.oats.uniformity}
\docType{data}
\title{
  Uniformity trial of oats
}
\description{
  Uniformity trial of oats at Nebraska in 1916.
}
\usage{data("kiesselbach.oats.uniformity")}
\format{
  A data frame with 207 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield bu/ac}
  }
}
\details{

  Experiment conducted in 1916.  Crop was Kerson oats. Each plot covered 1/30th acre.
  Oats were drilled in plats 66 inches wide by 16 rods long. The drill
  was 66 inches wide.  Plats were separated by a space of 16 inches
  between outside drill rows.
  
  The source document includes three photographs of the field.
  
  1 acre = 43560 sq feet
  
  1/30 acre = 1452 sq feet = 16 rods * 16.5 ft/rod * 5.5 ft

  Field width: 3 plats * 16 rods/plat * 16.5 ft/rod = 792 feet

  Field length: 69 plats * 5.5 ft + 68 gaps * 1.33 feet = 469 feet

}
\source{
  Kiesselbach, Theodore A. (1917).
  Studies Concerning the Elimination of Experimental Error in Comparative Crop Tests.
  University of Nebraska Agricultural Experiment Station Research Bulletin No. 13.
  Pages 51-72.
  https://archive.org/details/StudiesConcerningTheEliminationOfExperimentalErrorInComparativeCrop
  http://digitalcommons.unl.edu/extensionhist/430/
}
\references{
  None.
}
\examples{
\dontrun{

library(agridat)
  
  data(kiesselbach.oats.uniformity)
  dat <- kiesselbach.oats.uniformity
  
  range(dat$yield) # 56.7 92.8 match Kiesselbach p 64.

  libs(desplot)
  desplot(yield ~ col*row, dat,
          tick=TRUE, flip=TRUE, aspect=792/469, # true aspect
          main="kiesselbach.oats.uniformity")
  
}
}
\keyword{datasets}
