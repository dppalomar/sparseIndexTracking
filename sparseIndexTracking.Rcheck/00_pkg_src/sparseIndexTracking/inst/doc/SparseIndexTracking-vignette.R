## ---- echo = FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.retina = 2,
  out.width = "75%",
  dpi = 96
)
knit_hooks$set(pngquant = hook_pngquant)
#Help on bookdown: https://bookdown.org/yihui/bookdown/
#rmarkdown::render("vignettes/SparseIndexTracking-vignette.Rmd", "all")
#rmarkdown::render("vignettes/SparseIndexTracking-vignette.Rmd", "bookdown::html_document2")
#rmarkdown::render("vignettes/SparseIndexTracking-vignette.Rmd", "bookdown::pdf_document2")
#tools::compactPDF("vignettes/SparseIndexTracking-vignette.pdf", gs_quality = "ebook")

## ---- message = FALSE----------------------------------------------------
library(sparseIndexTracking)
library(xts)
data(data_2010_2011)

## ------------------------------------------------------------------------
X_train <- data_2010_2011$X[1:126]
X_test <- data_2010_2011$X[127:252]
r_train <- data_2010_2011$SP500[1:126]
r_test <- data_2010_2011$SP500[127:252]

## ------------------------------------------------------------------------
plot(cbind("PortfolioETE" = cumprod(1 + X_test %*% w_ete$w), cumprod(1 + r_test)), 
     legend.loc = "topleft", main = "Cumulative P&L")
plot(cbind("PortfolioDR" = cumprod(1 + X_test %*% w_dr$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")
plot(cbind("PortfolioHETE" = cumprod(1 + X_test %*% w_hete$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")
plot(cbind("PortfolioHDR" = cumprod(1 + X_test %*% w_hdr$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")

## ----dotcom, echo = FALSE, out.width = '80%', fig.cap = "Dot-com bubble."----
knitr::include_graphics('figures/per1_126_22_hub4_w.png', auto_pdf = TRUE)

## ----greatres, echo = FALSE, out.width = '80%', fig.cap = "Great recession."----
knitr::include_graphics('figures/per2_126_22_hub4_w.png', auto_pdf = TRUE)

## ----stablemarket, echo = FALSE, out.width = '80%', fig.cap = "Stable market."----
knitr::include_graphics('figures/per4_126_22_hub4_w.png', auto_pdf = TRUE)

