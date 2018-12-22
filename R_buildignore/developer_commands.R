##
## User installation
##
# Local installation
install.packages(file.choose(), repos = NULL, type="source")
# Installation from GitHub
devtools::install_github("dppalomar/sparseIndexTracking")
# Installation from CRAN
install.packages("sparseIndexTracking")
# Getting help
library(sparseIndexTracking)
help(package="sparseIndexTracking")
package?sparseIndexTracking
?spIndexTrack
?INDEX_2010


##
## Developer commands (http://r-pkgs.had.co.nz/)
##
devtools::load_all()  #or Ctrl-Shift-L
devtools::install()
library(sparseIndexTracking)

# Documentation
devtools::document()  # to generate all documentation via roxygen
?spIndexTrack
?INDEX_2010


# Code tests
#devtools::use_testthat()  # the first time
devtools::test()
#covr::package_coverage()  # coverage of tests
#goodpractice::gp()  # overall checks


# CRAN check and submission (http://r-pkgs.had.co.nz/release.html)
#  checklist: https://kalimu.github.io/post/checklist-for-r-package-submission-to-cran/
devtools::check()
rcmdcheck::rcmdcheck()
devtools::build()
#devtools::build_win()  #to check under windows
#R CMD build .  # this is to generate tarball
#R CMD build . --compact-vignettes=gs+qpdf
#R CMD check sparseIndexTracking_0.1.0.tar.gz --as-cran  # this is before submission to CRAN
#submit the tarball directly via the webform: https://cran.r-project.org/submit.html



# # Reverse dependencies
# tools::dependsOnPkgs("sparseIndexTracking")
# tools::package_dependencies("sparseIndexTracking", reverse = TRUE)
# devtools::revdep_check()
# devtools::package_deps("sparseIndexTracking")

