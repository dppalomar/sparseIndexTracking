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
grid()

# nice plot with xts
plot(cbind("portfolio" = cumprod(1 + X %*% w), cumprod(1 + SP500)), legend.loc = "topleft", main = "Cumulative P&L")

