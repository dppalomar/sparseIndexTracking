library(xts)
library(sparseIndexTracking)
library(ROI)
#load('R_buildignore/data_2010_2015.RData')
data(data_2010_2015)


X_train <- data_2010_2015$X[1:126,]
X_test <- data_2010_2015$X[127:252,]
r_train <- data_2010_2015$SP500[1:126]
r_test <- data_2010_2015$SP500[127:252]

num_assets <- ncol(X_train)
num_days <- nrow(X_train)
lambda_roi <- 1e-6
u <- 0.05

Q <- matrix(0, nrow = 2*num_assets, ncol = 2*num_assets)
Q[1:num_assets,1:num_assets] <- 2 * 1/num_days * t(X_train) %*% X_train

Lobj <- rep(0, (2*num_assets))
Lobj[1:num_assets] <- -2/num_days * t(X_train) %*% r_train
Lobj[(num_assets+1):(2*num_assets)] <- lambda_roi

Lc <- matrix(0, nrow = (num_assets + 1), ncol = (2*num_assets))
Lc[1, 1:num_assets] <- 1  # sum(w) = 1
Lc[2:(num_assets+1), 1:num_assets] <- diag(num_assets) # w <= u*s
Lc[2:(num_assets+1), (num_assets+1):(2*num_assets)] <- -u * diag(num_assets)

rhs <- c(1, rep.int(0, num_assets))
dir <- c("=", rep("<=", num_assets))
prob <- OP(objective = Q_objective(Q, Lobj),
           constraints = L_constraint(L = Lc,
                                      dir = dir,
                                      rhs = rhs),
           bounds = V_bound(li = 1:(2*num_assets),
                            ui = 1:(2*num_assets),
                            lb = rep(0, 2*num_assets),
                            ub = c(rep(u, num_assets), rep(1, num_assets))
                            ),
           types =  c(rep("C", num_assets), rep("B", num_assets))
           )


 res <- ROI_solve(prob)


