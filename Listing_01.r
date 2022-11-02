chsh -s /bin/zsh
cd /Users/polinalemenkova/Documents/R/Image_Processing/LC09_L1TP_197055_20220111_20220122_02_T1
for f in *tif ; do  echo $f; gdalinfo $f | grep Size; done
