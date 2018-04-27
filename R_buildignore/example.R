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
grid()
