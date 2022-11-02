# Relation between bands
library(terra)
setwd("/Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1")
filenames <- paste0('LC09_L1TP_197055_20220111_20220122_02_T1_B', 1:11, ".tif")
filenames
landsat <- rast(filenames)
landsat
# Removing the last four bands (Panchromatic, Cirrus, TIRS1, TIRS2) by selecting the necessary ones.
landsatsub <- subset(landsat, 1:7)
pairs(landsatsub[[1:2]], hist=TRUE, cor=TRUE, use="pairwise.complete.obs", maxcells=100000, main = "Correlation of Band 1 (Ultra-blue) against Blue (Band 2)")
pairs(landsatsub[[4:5]], hist=TRUE, cor=TRUE, maxcells=100000, main = "Correlation of Band 4 (Red) against NIR (Band 5)")
