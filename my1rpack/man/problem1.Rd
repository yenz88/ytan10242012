\name{problem1}
\alias{problem1}
\title{Graph generator}
\description{This graphs and generates a .tex and a .pdf file of a specified function over a specified domain. }
\usage{
          problem1(filename, fcnobj, range, nsample, compile)
       }
\arguments{
  \item{filename}{character vector}
  \item{fcnobj}{function object}
  \item{range}{numeric vector}
  \item{nsample}{numeric vector}
  \item{compile}{logical value}
}

\value{
  \itemize{
    \item nothing returned  
          }
}
\author{Yen
}
\examples{
          problem1('problem1test', dnorm, c(-5,5), 100, TRUE)
          }

