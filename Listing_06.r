# Mosaic raw landsat tifs
# Stacks
library(raster)
blue = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B2.TIF")
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF")
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF")
rgb = stack(red, green, blue)
plotRGB(rgb, scale=65535)
# Stretch to stretch option on plotRGB() can improve the rendering of the scene. lin stretches the values evenly from the minimum to the minimum, and hist distributes them more evenly across the range.
plotRGB(rgb, stretch="lin")
plotRGB(rgb, stretch="hist")
# False color composites
# Color Infrared: colors near-infrared (band 5) as red, red (band 4) as green, and green (band 3) as blue
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF")
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF")
near.infrared = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
rgb = stack(near.infrared, red, green)
#
# Landsat 8 OLI colour composite image, RGB=753
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B7.TIF")
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
near.infrared = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF")
rgb = stack(near.infrared, red, green)
plotRGB(rgb, scale=65535, stretch="hist")
# Landsat 8 OLI colour composite image, RGB=765.
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B7.TIF")
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B6.TIF")
blue = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
rgb = stack(red, green, blue)
plotRGB(rgb, scale=65535, stretch="hist")
# Landsat 8 OLI colour composite image, RGB=742.
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B7.TIF")
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF")
blue = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B2.TIF")
rgb = stack(red, green, blue)
plotRGB(rgb, scale=65535, stretch="hist")
# Landsat 8 OLI colour composite image, RGB=573.
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B7.TIF")
blue = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF")
rgb = stack(red, green, blue)
plotRGB(rgb, scale=65535, stretch="hist")
# Landsat 8 OLI colour composite image, Color Infrared: RGB=543
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF")
near.infrared = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B3.TIF")
rgb = stack(near.infrared, red, green)
plotRGB(rgb, scale=65535, stretch="hist")
# Landsat 8 OLI colour composite image, Color Infrared: RGB=654
green = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B6.TIF")
red = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B5.TIF")
near.infrared = raster("LC09_L1TP_197055_20220111_20220122_02_T1_B4.TIF")
rgb = stack(near.infrared, red, green)
plotRGB(rgb, scale=65535, stretch="hist")

#
library(terra)
## terra version 1.2.10
# Blue
b2 <- rast('data/rs/LC08_044034_20170614_B2.tif') # Green
b3 <- rast('data/rs/LC08_044034_20170614_B3.tif') # Red
b4 <- rast('data/rs/LC08_044034_20170614_B4.tif')
# Near Infrared (NIR)
b5 <- rast('data/rs/LC08_044034_20170614_B5.tif')
