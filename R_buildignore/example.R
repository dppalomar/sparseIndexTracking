library(xts)
library(sparseIndexTracking)
#load('R_buildignore/data_2010_2015.RData')
data(data_2010_2015)


X_train <- data_2010_2015$X[1:126,]
X_test <- data_2010_2015$X[127:252,]
r_train <- data_2010_2015$SP500[1:126]
r_test <- data_2010_2015$SP500[127:252]

#### Algorithms

# ETE
lambda <- 1e-7
w_ete <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='ete')

cat('Number of assets used:', sum(w_ete > 1e-6))

# nice plot with xts (Benidis, note this!)
plot(cbind("PortfolioETE" = cumprod(1 + X_test %*% w_ete$w), cumprod(1 + r_test)), legend.loc = "topleft", main = "Cumulative P&L")

# DR
lambda <- 2e-8
w_dr <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='dr')

cat('Number of assets used:', sum(w_dr > 1e-6))

plot(cbind("PortfolioDR" = cumprod(1 + X_test %*% w_dr$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")

# HETE
lambda <- 8e-8
w_hete <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='hete', hub=0.05)

cat('Number of assets used:', sum(w_hete > 1e-6))

plot(cbind("PortfolioHETE" = cumprod(1 + X_test %*% w_hete$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")

# HDR
lambda <- 2e-8
w_hdr <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='hdr', hub=0.05)

cat('Number of assets used:', sum(w_hdr > 1e-6))

plot(cbind("PortfolioHDR" = cumprod(1 + X_test %*% w_hdr$w), cumprod(1 + r_test)),
     legend.loc = "topleft", main = "Cumulative P&L")

