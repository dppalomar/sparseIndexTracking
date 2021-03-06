#' sparseIndexTracking: Design of Portfolio of Stocks to Track an Index
#'
#' Computation of sparse portfolios for financial index tracking, i.e., joint
#' selection of a subset of the assets that compose the index and computation
#' of their relative weights (capital allocation). The level of sparsity of the
#' portfolios, i.e., the number of selected assets, is controlled through a
#' regularization parameter. Different tracking measures are available, namely,
#' the empirical tracking error (ETE), downside risk (DR), Huber empirical
#' tracking error (HETE), and Huber downside risk (HDR). See vignette for a
#' detailed documentation and comparison, with several illustrative examples.
#'
#' @section Functions:
#' \code{\link{spIndexTrack}}
#'
#' @section Help:
#' For a quick help see the README file:
#' \href{https://CRAN.R-project.org/package=sparseIndexTracking/readme/README.html}{CRAN-README} and
#' \href{https://github.com/dppalomar/sparseIndexTracking/blob/master/README.md}{GitHub-README}.
#'
#' For more details see the vignette:
#' \href{https://CRAN.R-project.org/package=sparseIndexTracking/vignettes/SparseIndexTracking.html}{CRAN-html-vignette},
#' \href{https://CRAN.R-project.org/package=sparseIndexTracking/vignettes/SparseIndexTracking-pdf.pdf}{CRAN-pdf-vignette},
#' \href{https://raw.githack.com/dppalomar/sparseIndexTracking/master/vignettes/SparseIndexTracking.html}{GitHub-html-vignette}, and
#' \href{https://docs.google.com/viewer?url=https://github.com/dppalomar/sparseIndexTracking/raw/master/vignettes/SparseIndexTracking-pdf.pdf}{GitHub-pdf-vignette}.
#'
#' @author Konstantinos Benidis and Daniel P. Palomar
#'
#' @references
#' K. Benidis, Y. Feng, and D. P. Palomar, "Sparse Portfolios for High-Dimensional Financial Index Tracking,"
#' \emph{IEEE Transactions on Signal Processing}, vol. 66, no. 1, pp. 155-170, Jan. 2018.
#'
#' @docType package
#' @name sparseIndexTracking-package
NULL
