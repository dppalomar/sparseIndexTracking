# library(R.matlab)
# library(xts)
#
# #read Matlab data
# filename <- 'per2_126_67_hub4'
# matlab_data <- readMat(paste0(filename, ".mat"))
#
# #get dates and indices for desired dates
# dates <- as.Date(matlab_data$dates, origin = as.Date("0000-01-01")-1)
# # dates <- as.Date(matlab_data$dates[-(1:21)], origin = as.Date("0000-01-01")-1) # for monthly data
#
# #get all portfolios
# normalized_wealth <- xts(cbind(matlab_data$norm.wealth[,2:5], matlab_data$norm.wealth[,1]), dates)
# colnames(normalized_wealth) <- c('ETE', 'DR', 'HETE', 'HDR', 'SP500')
#
# excessPnL <- xts(matlab_data$excess.pnl[, 2:5], dates)
# colnames(excessPnL) <- c('ETE', 'DR', 'HETE', 'HDR')
#
# #save data for R and Matlab
# save(normalized_wealth, excessPnL, file = paste0(filename, ".RData"))

## PLOTS
library(xts)

periods <- list(1, 2, 4)
test_windows <- list(22, 67)
return_type <- list('', '_w')

for (p in periods){
  for (tw in test_windows){
    for (rt in return_type){
      name = paste0('per', p,'_126_', tw, '_hub4', rt)
      load(paste0(name, '.RData'))

      png(file=paste0(name, '.png'), width = 13, height = 9.5, units = "cm", res = 800)
      par(mfrow=c(2,1))
      plot(normalized_wealth, legend.loc = 'bottomleft', main = "Normalized P&L")
      plot(excessPnL, main = "Excess P&L")
      dev.off()

      pdf(paste0(name, '.pdf'), width = 13*0.393701, height = 9.5*0.393701)
      par(mfrow=c(2,1))
      plot(normalized_wealth, legend.loc = 'bottomleft', main = "Normalized P&L")
      plot(excessPnL, main = "Excess P&L")
      dev.off()
    }
  }
}

# load('per4_126_22_hub4_w.RData')
#
# png(file="per4_126_22_hub4_w.png", width = 13, height = 9.5, units = "cm", res = 800)
# par(mfrow=c(2,1))
# plot(normalized_wealth, legend.loc = 'bottomleft', main = "Normalized P&L")
# plot(excessPnL, main = "Excess P&L")
# dev.off()
#
# pdf('per4_126_22_hub4_w.pdf', width = 13*0.393701, height = 9.5*0.393701)
# par(mfrow=c(2,1))
# plot(normalized_wealth, legend.loc = 'bottomleft', main = "Normalized P&L")
# plot(excessPnL, main = "Excess P&L")
# dev.off()

