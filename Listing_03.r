library(terra)
## terra version 1.2.11
# Change working directory
setwd("/Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1")
b1 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B1.TIF') # Ultra Blue
b2 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B2.TIF') # Blue
b3 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF') # Green
b4 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF') # Red
b5 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF') # Near Infrared (NIR)
b6 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B6.TIF') # Green
b7 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B7.TIF') # Red
b9 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B9.TIF') # Near Infrared (NIR)
b8 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B8.TIF') # Panchromatic
b10 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B10.TIF') # Thermal Infrared (TIRS) 1
b11 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B11.TIF') # Thermal Infrared (TIRS) 2.
# Plotting selected individual 6 bands
par(mfrow = c(2,2))
plot(b2, main = "Blue (Band 2)", col = gray(0:100 / 100))
plot(b3, main = "Green (Band 3)", col = gray(0:100 / 100))
plot(b4, main = "Red (Band 4)", col = gray(0:100 / 100))
plot(b5, main = "NIR (Band 5)", col = gray(0:100 / 100))
plot(b6, main = "SWIR (Band 6)", col = gray(0:100 / 100))
# Plotting natural color composite from bands B4, B3 and B2.
landsatRGB <- c(b4, b3, b2)
plotRGB(landsatRGB, stretch = "lin")
# Plotting 11 original individual 11 layers (raw bands) of the multi-spectral image Landsat-9.
par(mfrow = c(4, 3))
plot(b1, main = "Ultra Blue (Band 1)", col = gray(0:100 / 100), legend=TRUE)
plot(b2, main = "Blue (Band 2)", col = gray(0:100 / 100), legend=TRUE)
plot(b3, main = "Green (Band 3)", col = gray(0:100 / 100), legend=TRUE)
plot(b4, main = "Red (Band 4)", col = gray(0:100 / 100), legend=TRUE)
plot(b5, main = "NIR (Band 5)", col = gray(0:100 / 100), legend=TRUE)
plot(b6, main = "SWIR (Band 6)", col = gray(0:100 / 100), legend=TRUE)
plot(b7, main = "NIR (Band 7)", col = gray(0:100 / 100), legend=TRUE)
plot(b8, main = "Panchromatic (Band 8)", col = gray(0:100 / 100), legend=TRUE)
plot(b9, main = "Cirrus (Band 9)", col = gray(0:100 / 100), legend=TRUE)
plot(b10, main = "TIRS 1 (Band 10)", col = gray(0:100 / 100), legend=TRUE)
plot(b11, main = "TIRS 2 (Band 11)", col = gray(0:100 / 100), legend=TRUE)
# Natural color composite
landsatRGB <- c(b4, b3, b2)
plotRGB(landsatRGB, stretch = "lin")
