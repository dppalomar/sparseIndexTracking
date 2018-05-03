##
## User installation
##
# Local installation
install.packages(file.choose(), repos = NULL, type="source")
# Installation from GitHub
devtools::install_github("dppalomar/sparseIndexTracking")
# Getting help
library(sparseIndexTracking)
help(package="sparseIndexTracking")
package?sparseIndexTracking
?spIndexTrack
?data(data_1999_2005)



##
## Developer commands (http://r-pkgs.had.co.nz/)
##
library(devtools)
#devtools::create("sparseIndexTracking")
devtools::load_all()  #or Ctrl-Shift-L
#devtools::use_package("mvtnorm")
devtools::install()
devtools::build()  # to generate the installation file
#devtools::use_readme_rmd()  # to create the README file
#devtools::use_data_raw()  # to set up the raw-data folder

# Vignettes
#devtools::use_vignette("SparseIndexTracking")  # to create the folder the first time
#rmarkdown::render("vignettes/SparseIndexTracking.Rmd", "md_document")  # this is to generate the .md for GitHub
#rmarkdown::render("vignettes/SparseIndexTracking.Rmd", "pdf_document")
rmarkdown::render("vignettes/SparseIndexTracking.Rmd", "all")  # this also generates the pdf
tools::compactPDF("vignettes/SparseIndexTracking.pdf", gs_quality = "ebook")  # this compresses the pdf
#devtools::build_vignettes()  # I think this is obsolete, do not use
#browseVignettes("sparseIndexTracking")
#help(package="sparseIndexTracking")

# Documentation
devtools::document()  #to generate all documentation via roxygen
?spIndexTrack

# README (.md file has to be generated manually by clicking Knitr)


# code style
lintr::lint_package()


# Code tests
#devtools::use_testthat()  # the first time
devtools::test()
covr::package_coverage()  #coverage of tests
#goodpractice::gp()  # overall checks


# CRAN check
devtools::check()
rcmdcheck::rcmdcheck()
devtools::build()
#R CMD build .
#R CMD check sparseIndexTracking_0.1.0.tar.gz --as-cran  # this is before submission to CRAN

# to upload to CRAN
devtools::build_win()
devtools::release()  #for CRAN
