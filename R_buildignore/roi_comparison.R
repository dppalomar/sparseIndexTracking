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

dir <- c("==", rep("<=", num_assets))
rhs <- c(1, rep.int(0, num_assets))
prob <- OP(objective = Q_objective(Q, Lobj),
           constraints = L_constraint(L = Lc,
                                      dir = dir,
                                      rhs = rhs),
           bounds = V_bound(li = 1:(2*num_assets),
                            ui = 1:(2*num_assets),
                            lb = rep(0, 2*num_assets),
                            ub = c(rep(u, num_assets), rep(1, num_assets))),
           types =  c(rep("C", num_assets), rep("B", num_assets))
           )

########################################################
# Solvers available for this problem:
# [1] "ROI.plugin.cplex"  "ROI.plugin.cplex"  "ROI.plugin.gurobi" "ROI.plugin.mosek"  "ROI.plugin.neos"
# [6] "ROI.plugin.gurobi" "ROI.plugin.mosek"
ROI_available_solvers(prob)$Package

# Solvers installed (not necessarily loaded):
ROI_installed_solvers()

#trying to install ROI.plugin.gurobi, but I don't have gurobi (required)
#install.packages("ROI.plugin.gurobi")
#devtools::install_github('kuol/ROI.plugin.gurobi')
#library(ROI.plugin.gurobi)

#trying to install ROI.plugin.cplex, but I don't have cplex (required)
#install.packages("ROI.plugin.cplex")

#trying to install ROI.plugin.mosek, but I don't have Rmosek (required)
#install.packages("ROI.plugin.mosek")
#devtools::install_github("Fl0Sch/ROI.plugin.mosek")


# Solvers installed and loaded (registered) in system:
ROI_registered_solvers()

# Solvers installed and loaded in system applicable to the particular problem:
ROI_applicable_solvers(prob)
########################################################


res <- ROI_solve(prob)


