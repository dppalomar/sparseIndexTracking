library(xts)
library(sparseIndexTracking)
#load('R_buildignore/data_2010_2015.RData')
data(data_2010_2015)


X_train <- lin_returns[1:126,]
X_test <- lin_returns[127:252,]
r_train <- SP500[1:126]
r_test <- SP500[127:252]
dates_test <- dates[127:252]


#### Algorithms

# ETE
lambda <- 1e-7
w_ete <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='ete')

cat('Number of assets used:', sum(w_ete > 1e-6))

# ugly plot without xts
matplot(dates_test, cbind(cumprod(1 + X_test %*% w_ete$w), cumprod(1 + r_test)),
        type = 'l', xlab = 'Days', ylab = 'Wealth', xaxt='n')
axis.Date(1, at=dates_test, format='%b %y', cex.axis = .7)
legend("topleft", c('Portfolio (ETE)', 'S&P 500'), col = seq_len(2), fill=seq_len(2), cex=0.8, bty='n')
grid()

# nice plot with xts (Benidis, note this!)
plot(cbind("PortfolioETE" = cumprod(1 + X_test %*% w_ete$w), cumprod(1 + r_test)), legend.loc = "topleft", main = "Cumulative P&L")


# DR
lambda <- 2e-8
w_dr <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='dr')

cat('Number of assets used:', sum(w_dr > 1e-6))

matplot(dates_test, cbind(cumprod(1 + X_test %*% w_dr$w), cumprod(1 + r_test)),
        type = 'l', xlab = 'Days', ylab = 'Wealth', xaxt='n')
axis.Date(1, at=dates_test, format='%b %y', cex.axis = .7)
legend("topleft", c('Portfolio (DR)', 'S&P 500'), col = seq_len(2), fill=seq_len(2), cex=0.8, bty='n')
grid()


# HETE
lambda <- 8e-8
w_hete <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='hete', hub=0.05)

cat('Number of assets used:', sum(w_hete > 1e-6))

matplot(dates_test, cbind(cumprod(1 + X_test %*% w_hete$w), cumprod(1 + r_test)),
        type = 'l', xlab = 'Days', ylab = 'Wealth', xaxt='n')
axis.Date(1, at=dates_test, format='%b %y', cex.axis = .7)
legend("topleft", c('Portfolio (HETE)', 'S&P 500'), col = seq_len(2), fill=seq_len(2), cex=0.8, bty='n')
grid()


# HDR
lambda <- 2e-8
w_hdr <- spIndexTrack(X_train, r_train, lambda, u=0.5, measure='hdr', hub=0.05)

cat('Number of assets used:', sum(w_hdr > 1e-6))

matplot(dates_test, cbind(cumprod(1 + X_test %*% w_hdr$w), cumprod(1 + r_test)),
        type = 'l', xlab = 'Days', ylab = 'Wealth', xaxt='n')
axis.Date(1, at=dates_test, format='%b %y', cex.axis = .7)
legend("topleft", c('Portfolio (HDR)', 'S&P 500'), col = seq_len(2), fill=seq_len(2), cex=0.8, bty='n')
grid()

