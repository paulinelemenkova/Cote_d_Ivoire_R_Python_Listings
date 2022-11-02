library(terra)
setwd("/Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1")
filenames <- paste0('LC09_L1TP_197055_20220111_20220122_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
# Removing the last four bands (Panchromatic, Cirrus, TIRS1, TIRS2) by selecting the necessary ones.
landsatsub <- subset(landsat, 1:7)
# alternatively
landsatsub <- landsat[[1:7]]
names(landsatsub)
# Checking Nnumber of bands in the original and new data
nlyr(landsatsub)
## [1] 7
# Renaming the bands
names(landsatsub) <- c("ultra-blue", "blue", "green", "red", "NIR", "SWIR1", "SWIR2")
names(landsatsub)
