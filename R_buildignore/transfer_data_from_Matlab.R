library(R.matlab)

date_from <- as.Date("2010-01-01")  #"1995-01-04"
date_to <- as.Date("2017-06-30")  #"2017-06-30"
#date_from <- as.Date("1995-01-04")  #"1995-01-04"
#date_to <- as.Date("2017-06-30")  #"2017-06-30"


#read Matlab data
matlab_data <- readMat('[your path]/data sources/SP500 and stocks with sectors from Bloomberg (Jan95 to Jun16)/SP500_Jan95_Jun16.mat')

#get dates and indices for desired dates
dates <- as.Date(matlab_data$all.dates, origin = as.Date("0000-01-01")-1)
date_indices <- which(dates %in% seq(date_from, date_to, by = "days"))
dates <- dates[date_indices]

#get all tickers and sectors
tickers <- as.character(unlist(matlab_data$unique.ticks))
tickers_sectors <- as.character(unlist(matlab_data$sectors))

#keep only the active tickers during all those dates
mask <- matlab_data$mask.full[date_indices,] == 1
ticker_active <- apply(mask, 2, all)
ticker_indices <- which(ticker_active)
tickers <- tickers[ticker_indices]
tickers_sectors <- tickers_sectors[ticker_indices]
sprintf("Number of tickers = %d", length(tickers))

#get linear returns of SP500 and stocks for desired dates and active tickers
SP500 <- xts(matlab_data$SP500[date_indices], dates)
colnames(SP500) <- "SP500"

lin_returns <- xts(matlab_data$asset.returns[date_indices, ticker_indices], dates)
colnames(lin_returns) <- tickers

#recover the log-prices (except the origin which is set to zero)
log_returns <- log(1 + lin_returns)
log_prices <- xts(apply(log_returns, 2, cumsum), dates)

#some plots
plot(log_returns[, 1])
plot(log_prices[, 1])

#save data for R and Matlab
filename <- paste0("log_prices_", date_from, "--", date_to)
save(log_prices, tickers_sectors, file = paste0(filename, ".RData"))
writeMat(paste0(filename, ".mat"), log_prices=log_prices, tickers_sectors=tickers_sectors)
