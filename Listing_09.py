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
# Generate hillshade from DTM
hillshade = es.hillshade(elevation)
# Plot the data
fig, ax = plt.subplots(figsize=(10, 10))
ep.plot_bands(
    hillshade,
    ax=ax,
    cbar=True,
    cmap="cividis",
    title="Hillshade from DTM of Kossou Lake, Côte d'Ivoire. \n Data source: SRTM3 (3 arc-second resolution, 90 m), NASA/NGA. \nEntity ID: SRTM3N07W006V2. Aquisition date: 2000-02-11. cmap=cividis",
    figsize=(10, 10),
)
plt.show()
plt.savefig('Figure_2_Hillshade_Kossou_1609.jpg', dpi=300)
