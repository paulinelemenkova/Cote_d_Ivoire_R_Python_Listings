library(terra)
## terra version 1.2.11
# Change working directory
setwd("/Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1")
b2 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B2.TIF') # Blue
b3 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF') # Green
b4 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF') # Red
b5 <- rast('LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF') # Near Infrared (NIR)
# Check metadata by printing the variables
b2
# Check coordinate reference system (CRS)
crs(b2)
# Number of cells
ncell(b2)
# Number of rows & columns
dim(b2)
# Check spatial resolution
res(b2)
# Number of bands
nlyr(b2)
# Compare bands extent, number of rows and columns, projection, resolution and origin
compareGeom(b5, b4)
# Creating a SpatRaster with multiple layers from the existing SpatRaster (single layer) objects.
s <- c(b5, b4, b3)
# Check the properties of the multi-band image
s
# Creating a list of raster layers to use
filenames <- paste0('LC09_L1TP_197055_20220111_20220122_02_T1_B', 1:11, ".tif")
filenames
# resampling raster in Band 8 (Panchromatic) to the structure of all other bands using Band 1, to ignore the small difference, and the rasters have the same number of rows and columns:
library(raster)
r1 = raster::brick("LC09_L1TP_197055_20220111_20220122_02_T1_B8.tif")
r2 = raster::brick("LC09_L1TP_197055_20220111_20220122_02_T1_B1.tif")
r1 <- resample(r1, r2, method="bilinear")
s <- stack(r1, r2)
# creating the multi-layer SpatRaster using the filenames
landsat <- rast(filenames)
landsat
# The layers represent reflection intensity in the following wavelengths: Ultra Blue, Blue, Green, Red, Near Infrared (NIR), Shortwave Infrared (SWIR) 1, Shortwave Infrared (SWIR) 2, Panchromatic, Cirrus, Thermal Infrared (TIRS) 1, Thermal Infrared (TIRS) 2.
