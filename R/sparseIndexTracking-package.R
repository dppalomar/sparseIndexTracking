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
#' \href{https://rawgit.com/dppalomar/sparseIndexTracking/master/README.html}{GitHub-README} and
#'
#' For more details see the vignette:
#' \href{https://rawgit.com/dppalomar/sparseIndexTracking/master/vignettes/SparseIndexTracking-vignette.html}{GitHub-html-vignette},
#' \href{https://rawgit.com/dppalomar/sparseIndexTracking/master/vignettes/SparseIndexTracking-vignette.pdf}{GitHub-pdf-vignette}, and
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
