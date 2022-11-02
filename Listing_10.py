python3.10
# Set home directory
import os
os.chdir('/Users/polinalemenkova/Documents/Python/Image_Processing')
os. getcwd()
# Set data source
dtm = "n07_w006_3arc_v2.tif"
# Load libraries
from glob import glob
import earthpy as et
import earthpy.spatial as es
import earthpy.plot as ep
import rasterio as rio
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import ListedColormap
import plotly.graph_objects as go
np.seterr(divide='ignore', invalid='ignore')
# Open DEM by Rasterio which reads GeoTIFF format and stores gridded raster datasets of digital terrain models (DTMs) and satellite images
with rio.open(dtm) as src:
    elevation = src.read(1)

# Changing the azimuth of the sun of the hillshade layer to 210 degrees
hillshade_azimuth_230 = es.hillshade(elevation, azimuth=230)
# Plotting the hillshade layer with the modified azimuth
fig, ax = plt.subplots(figsize=(10, 10))
ep.plot_bands(
    hillshade_azimuth_230,
    ax=ax,
    cbar=True,
    cmap="plasma",
    title="Hillshade from DTM of Kossou Lake, Côte d'Ivoire. Azimuth of sun is adjusted to 230 \N{DEGREE SIGN}",
    figsize=(10, 10),
)
plt.show()
plt.savefig('Figure_3_Azimuth_hillshade_Kossou.jpg', dpi=300)

# Changing the angle altitude of sun
hillshade_angle_10 = es.hillshade(elevation, altitude=10)
# Plotting the hillshade layer with the modified angle altitude
fig, ax = plt.subplots(figsize=(10, 10))
ep.plot_bands(
    hillshade_angle_10,
    ax=ax,
    cbar=True,
    cmap="magma",
    title="Hillshade from DTM of Kossou Lake, Côte d'Ivoire. Angle altitude is defined as 10 \N{DEGREE SIGN}",
    figsize=(10, 10),
)
plt.show()
plt.savefig('Figure_4_Angle_hillshade_Kossou.jpg', dpi=300)
