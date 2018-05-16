library(sparseIndexTracking)
library(xts)
#data(data_2010_2015)

load("data_2010_2015.RData")
object.size(data_2010_2015)
test <- data_2010_2015
object.size(test)
object.size(test$X)
object.size(as.matrix(test$X))
object.size(as.numeric(test$X))

save(test, file = "test_gzip.RData")
#save(test, file = "test_gzip.RData", compress = "gzip", compression_level = 9)
#saveRDS(test, file = "test_gzip.rds")
#devtools::use_data(test, overwrite = TRUE)



#object.size(data_2010_2011)
#save(data_2010_2011, file = "data_2010_2011.RData")
