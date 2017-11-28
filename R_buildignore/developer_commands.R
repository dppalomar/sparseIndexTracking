##
## User installation
##
install.packages(file.choose(), repos = NULL, type="source")
library(sparseEigen)
help(package="sparseIndexTracking")
?xxxxx




##
## Developer commands (http://r-pkgs.had.co.nz/)
##
library(devtools)
#devtools::create("sparseIndexTracking")
devtools::load_all()  #or Ctrl-Shift-L
#devtools::use_package("mvtnorm")
devtools::document()  #to generate all documentation via roxygen
devtools::install()
devtools::build()  # to generate the installation file
#devtools::use_readme_rmd()  # to create the README file
#devtools::use_data_raw()  # to set up the raw-data folder
#devtools::use_vignette("sparse_eigenvectors")
devtools::build_vignettes() #or just install()
#rmarkdown::render("vignettes/sparse_eigenvectors.Rmd", "md_document")  # this is to generate the .md for GitHub
rmarkdown::render("vignettes/sparse_eigenvectors.Rmd", "all")

# code checking
lintr::lint_package()
devtools::check()

# code tests
#devtools::use_testthat()
devtools::test()
covr::package_coverage()  #coverage of tests


# overall checks:
#goodpractice::gp()

# CRAN check
rcmdcheck::rcmdcheck()
#R CMD check --as-cran  # this is before submission to CRAN



# to upload to CRAN or GitHub
#devtools::install_github("yourusername/myfirstpackage")  # for GitHub
#devtools::release()  #for CRAN
