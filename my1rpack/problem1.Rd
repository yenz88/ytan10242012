\name{problem1}
\alias{problem1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solution to Problem 1
}
\description{
This generates a tex file that can be compiled to generate a pdf file of a function
}
\usage{
problem1(filename, fcnname, range, nsample, compile)
}
\arguments{
  \item{filename}{character vector}
  \item{fcnname}{function object}
  \item{range}{numeric vector}
  \item{nsample}{numeric vector}
  \item{compile}{logical value}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  \itemize{
    \item nothing returned
          
          
          }
}
\author{Yen
}
\examples{
          problem1('yen', dnorm, c(-5,5), 100, T)
          }

