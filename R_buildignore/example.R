<<<<<<< HEAD
#source('spIndexTrack.R')
library(xts)
library(sparseIndexTracking)

# parameters
N <- 500  # number of assets
T <- 200  # days

# artificial data
mu <- rnorm(N) / 252
D <- 2 * diag(runif(N)) / sqrt(252)

C <- matrix(rep(0, N^2), nrow = N)
for (i in 1:N)
  for (j in 1:N)
    C[i, j] <- 0.7^(abs(i-j))

Sigma <- D %*% C %*% D

# asset returns
X <- MASS::mvrnorm(n = T, mu, Sigma)

# index
w_ind <- runif(N)
w_ind <- w_ind/sum(w_ind)
r_b <- X %*% w_ind

# algorithm
lambda <- 5e-7
w <- spIndexTrack(X, r_b, lambda, u = 0.5, measure = 'ete', hub = 0.05)

print(sum(w > 1e-6))

matplot(seq(T), cbind(cumprod(1 + X %*% w), cumprod(1 + r_b)), type = 'l', xlab = 'Days', ylab = 'Wealth')
legend("top", c('Portfolio', 'Index'), col = seq_len(2), cex=0.8, fill = seq_len(2))
grid()

###########################################

load('R_buildignore/data_2010_2015.RData')
# colNames <- colnames(lin_returns)
# Xc <- coredata(lin_returns)
# Xdf <- as.data.frame(lin_returns)
# X <- as.matrix(lin_returns)
# r_b <- coredata(SP500)
X <- lin_returns
N <- ncol(X)
T <- nrow(X)


cbind("portfolio" = X %*% w, SP500)


# algorithm
w <- spIndexTrack(X, r = SP500, lambda = 5e-7, u = 0.5, measure = 'ete', hub = 0.05)

print(sum(w > 1e-6))

# ugly plot without xts
matplot(seq(T), cbind(cumprod(1 + X %*% w), cumprod(1 + SP500)), type = 'l', xlab = 'Days', ylab = 'Wealth')
legend("top", c('Portfolio', 'Index'), col = seq_len(2), cex=0.8, fill = seq_len(2))
||||||| merged common ancestors
source('spIndexTrack.R')
library(xts)

# parameters
n <- 500 # number of assets
m <- 200 # days

# artificial data
mu <- rnorm(n) / 252
D <- 2 * diag(runif(n)) / sqrt(252)

C <- matrix(rep(0, n*n), nrow = n)
for (i in 1:n) {
  for (j in 1:n) {
    C[i, j] <- 0.7^(abs(i-j))
  }
}

Sigma <- D %*% C %*% D

# asset returns
X <- MASS::mvrnorm(n = m, mu, Sigma)

# index
t <- runif(n)
w_ind <- t/sum(t)
r_b <- X %*% w_ind

# load('data_2010_2015.RData')
#
# colNames <- colnames(lin_returns)
# Xc <- coredata(lin_returns)
# Xdf <- as.data.frame(lin_returns)
# X <- as.matrix(lin_returns)
#
# r_b <- coredata(SP500)

# algorithm
lambda <- 5e-7
w <- spIndexTrack(X, r_b, lambda, u = 0.5, measure = 'ete', hub = 0.05)

print(sum(w > 1e-6))

matplot(seq(m), cbind(cumprod(1 + X %*% w), cumprod(1 + r_b)), type = 'l', xlab = 'Days', ylab = 'Wealth')
legend("top", c('Portfolio', 'Index'), col = seq_len(2), cex=0.8, fill = seq_len(2))
=======
source('spIndexTrack.R')

load('data_2010_2015.RData')

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

matplot(dates_test, cbind(cumprod(1 + X_test %*% w_ete$w), cumprod(1 + r_test)),
        type = 'l', xlab = 'Days', ylab = 'Wealth', xaxt='n')
axis.Date(1, at=dates_test, format='%b %y', cex.axis = .7)
legend("topleft", c('Portfolio (ETE)', 'S&P 500'), col = seq_len(2), fill=seq_len(2), cex=0.8, bty='n')
grid()


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
>>>>>>> 85997f311cb23f127aefd2d1da33ff697a26f365
grid()

# nice plot with xts
plot(cbind("portfolio" = cumprod(1 + X %*% w), cumprod(1 + SP500)), legend.loc = "topleft", main = "Cumulative P&L")

