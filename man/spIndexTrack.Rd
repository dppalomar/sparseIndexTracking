% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spIndexTrack.R
\name{spIndexTrack}
\alias{spIndexTrack}
\title{Sparse Index Tracking}
\usage{
spIndexTrack(
  X,
  r,
  lambda,
  u = 1,
  measure = c("ete", "dr", "hete", "hdr"),
  hub = NULL,
  w0 = NULL,
  p_neg_exp = 7,
  max_iter = 1000,
  thres = 1e-09
)
}
\arguments{
\item{X}{m-by-n matrix of net returns (m samples, n assets).}

\item{r}{m dimensional vector of the net returns of the index.}

\item{lambda}{sparsity weight factor. Any nonnegative number (suggested range \code{[10^{-8},10^{-6}]}).}

\item{u}{upper bound of the weights.Default value \code{u <- 1}, i.e., no effective upper bound.}

\item{measure}{performance measure. Possible values \code{'ete'} (empirical tracking error - default), \code{'dr'} (downside risk),
\code{'hete'} (Huber empirical tracking error), and \code{'hdr'} (Huber downside risk).}

\item{hub}{Huber parameter. Required if \code{measure = 'hete'} or \code{measure = 'hdr'}.}

\item{w0}{initial point. If \code{NULL} a uniform allocation is used, i.e., \code{w0 <- rep(1/N, N)}.}

\item{p_neg_exp}{final negative exponent of p, so \code{p = exp(-p_neg_exp)} (default is \code{7}).}

\item{max_iter}{maximum number of iterations (default is \code{1000}).}

\item{thres}{threshold value. All the weights less or equal to \code{thres} are set to 0. The default value is \code{1e-9}.}
}
\value{
An n-dimensional vector with allocation weights on the assets.
}
\description{
Computes the weights of assets (relative capital allocation) for a sparse approximation of a financial index.
}
\examples{
library(sparseIndexTracking)
library(xts)

# load data
data(INDEX_2010)

# fit portfolio under error measure ETE (Empirical Tracking Error)
w_ete <- spIndexTrack(INDEX_2010$X, INDEX_2010$SP500, lambda = 1e-7, u = 0.5, measure = 'ete')

# show cardinality achieved
cat("Number of assets used:", sum(w_ete > 1e-6))

}
\references{
K. Benidis, Y. Feng, D. P. Palomar, "Sparse Portfolios for High-Dimensional Financial Index Tracking,"
\emph{IEEE Transactions on Signal Processing}, vol. 66, no. 1, pp. 155-170, Jan. 2018.
}
\author{
Konstantinos Benidis and Daniel P. Palomar
}
