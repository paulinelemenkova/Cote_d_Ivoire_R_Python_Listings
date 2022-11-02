# Computing vegetation indices
library(terra)
library(RColorBrewer)
setwd("/Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1")
# 1. Normalized Difference Vegetation Index (NDVI) = (NIR - R) / (NIR + R), i.e., NDVI = (Band 5 – Band 4) / (Band 5 + Band 4).
vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# For Landsat NIR = 5, red = 4.
ndvi <- vi(landsat, 5, 4)
plot(ndvi, col=rev(terrain.colors(20)), font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC09_L1TP_197055_20220111_20220122_02_T1: Yamassoukro, central Côte d'Ivoire", cex.main=0.9)
# Plotting histogram of the NDVI
hist(ndvi, font.main = 1, main = "NDVI values for Landsat-9 OLI/TIRS C1 image \n LC09_L1TP_197055_20220111_20220122_02_T1, Yamassoukro, central Côte d'Ivoire", xlab = "NDVI", ylab= "Frequency",
    col = "darkolivegreen1", xlim = c(-0.5, 1),  breaks = 30, xaxt = "n")
axis(side=1, at = seq(-0.6, 1, 0.1), labels = seq(-0.6, 1, 0.1))
#
# 2. Soil Adjusted Vegetation Index (SAVI) corrects NDVI for the influence of soil brightness in areas where vegetative cover is low
# SAVI = ((Band 5 – Band 4) / (Band 5 + Band 4 + 0.5)) * (1.5).
savi_fun = function(nir, red){
  ((nir - red) / (nir + red + 0.5)) * 1.5
}
savi = lapp(landsat[[c(4, 3)]],
            fun = savi_fun)
#plot(savi, col = topo.colors(30), font.main = 2, main = "Soil Adjusted Vegetation Index (SAVI) for Landsat-9 OLI/TIRS C1 image \nLC09_L1TP_197055_20220111_20220122_02_T1: Yamassoukro, central Côte d'Ivoire", cex.main=1.0)
plot(savi, col = brewer.pal(11, "Accent"), font.main = 2, main = "Soil Adjusted Vegetation Index (SAVI) for Landsat-9 OLI/TIRS C1 image \nLC09_L1TP_197055_20220111_20220122_02_T1: Yamassoukro, central Côte d'Ivoire", cex.main=1.0)
# Computing histogram for SAVI
hist(savi, font.main = 1, main = "SAVI values for Landsat-9 OLI/TIRS C1 image \n LC09_L1TP_197055_20220111_20220122_02_T1, Yamassoukro, central Côte d'Ivoire", xlab = "SAVI", ylab= "Frequency",
    col = "darkgoldenrod1", xlim = c(-0.4, 0.4),  breaks = 30, xaxt = "n")
axis(side=1, at = seq(-0.4, 0.4, 0.1), labels = seq(-0.4, 0.4, 0.1))
#
# 3. Enhanced Vegetation Index 2
# EVI2 = 2.4 * (Band 5 – Band 4) / (Band 5 + Band 4 + 1).
evi2_fun = function(nir, red){
  2.4 * ((nir - red) / (nir + red + 1))
}
evi2 = lapp(landsat[[c(4, 3)]],
            fun = evi2_fun)
plot(evi2, col = brewer.pal(9, "Set1"), font.main = 2, main = "Enhanced Vegetation Index 2 (EVI2) for Landsat-9 OLI/TIRS C1 image \nLC09_L1TP_197055_20220111_20220122_02_T1: Yamassoukro, central Côte d'Ivoire", cex.main=0.9)
# Computing histogram for EVI2
hist(evi2, font.main = 1, main = "EVI2 values for Landsat-9 OLI/TIRS C1 image \n LC09_L1TP_197055_20220111_20220122_02_T1, Yamassoukro, central Côte d'Ivoire", xlab = "SAVI", ylab= "Frequency",
    col = "darkorchid1", xlim = c(-0.4, 0.4),  breaks = 30, xaxt = "n")
axis(side=1, at = seq(-0.4, 0.4, 0.1), labels = seq(-0.4, 0.4, 0.1))
#
# 4. Atmospherically Resistant Vegetation Index 2 (ARVI2)
# ARVI2 = −0.18 + 1.17 ((nir − red) / (nir + red))
arvi_fun = function(nir, red){
  ((nir - red) / (nir + red)) * 1.17 - 0.18
}
arvi = lapp(landsat[[c(4, 3)]],
            fun = arvi_fun)
plot(arvi, col = brewer.pal(12, "Paired"), font.main = 1, main = "Atmospherically Resistant Vegetation Index 2 (ARVI2) for Landsat-9 OLI/TIRS C1 \nimage LC09_L1TP_197055_20220111_20220122_02_T1: Yamassoukro, Côte d'Ivoire", cex.main=0.9)
# Computing histogram for ARVI2
hist(arvi, font.main = 1, main = "ARVI2 values for Landsat-9 OLI/TIRS C1 image \n LC09_L1TP_197055_20220111_20220122_02_T1, Yamassoukro, Côte d'Ivoire", xlab = "ARVI2", ylab= "Frequency",
    col = "cyan1", xlim = c(-0.4, 0.1),  breaks = 30, xaxt = "n")
axis(side=1, at = seq(-0.4, 0.1, 0.1), labels = seq(-0.4, 0.1, 0.1))
